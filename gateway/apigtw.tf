# API Gateway REST API com OpenAPI gerado dinamicamente
resource "aws_apigatewayv2_api" "api-gtw" {
  name = "deivi-motors-api-gtw"
  protocol_type = "HTTP"

  body = templatefile("openapi.yaml", {
    alb_dns     = data.aws_lb.ingress_alb.dns_name,
    region      = var.region,
    account_id  = data.aws_caller_identity.current.account_id,
    lambda_arn  = data.aws_lambda_function.authentication.arn,
    # Recupera as informações do cognito pelo tfstate do cluster
    cognito_userpool_id = data.terraform_remote_state.cluster.outputs.cognito_userpool_id
    cognito_client_id = data.terraform_remote_state.cluster.outputs.cognito_client_id
  })
}

# Deployment da API
resource "aws_apigatewayv2_deployment" "api_deployment" {
  api_id = aws_apigatewayv2_api.api-gtw.id

  triggers = {
    redeployment = sha1(jsonencode(aws_apigatewayv2_api.api-gtw.body))
  }

  lifecycle {
    create_before_destroy = true
  }
}

# Stage "prod"
resource "aws_apigatewayv2_stage" "prod" {
  api_id   = aws_apigatewayv2_api.api-gtw.id
  deployment_id = aws_apigatewayv2_deployment.api_deployment.id
  name    = "prod"
  # auto_deploy   = true
}
