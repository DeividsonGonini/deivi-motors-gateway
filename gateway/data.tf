data "aws_iam_user" "principal_user" {
  user_name = "" # Identificador do usuario que queremos as infos.
}

# TODO DESCOMENTAR
# data "aws_secretsmanager_secret" "data_base_secrets" {
#   name = "sale/prod/db"
# }

data "aws_caller_identity" "current" {}

# TODO DESCOMENTAR
# Descobre o ALB criado automaticamente pelo Ingress Controller
data "aws_lb" "ingress_alb" {
  name = "deivi-motors-alb"
}


data "aws_lambda_function" "authentication"{
  function_name = "AuthenticationFunction"
}

data "terraform_remote_state" "cluster" {
  backend = "s3"

  config = {
    bucket = "tfstate-infra-deivi-motors"
    key    = "infra-terraform/terraform.tfstate"
    region = "us-east-1"
  }
}