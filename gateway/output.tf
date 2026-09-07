## DNS Name ##
output "api_gateway_id" {
  description = "ID da API Gateway gerada"
  value       = aws_apigatewayv2_api.api-gtw.id
}

output "api_gateway_invoke_url" {
  description = "Endpoint base para invocar a API"
  value       = "https://${aws_apigatewayv2_api.api-gtw.id}.execute-api.${var.region}.amazonaws.com/${aws_apigatewayv2_stage.prod.name}"
}

output "aws_alb" {
  value = data.aws_lb.ingress_alb.dns_name
}