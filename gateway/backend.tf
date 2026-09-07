### Escolher Na aws
terraform {
  backend "s3" {
    bucket = "tfstate-infra-deivi-motors" #Nome do bucket
    key    = "infra-gateway-deivi-motors/terraform.tfstate" #Caminho onde o tfstate será salvo
    region = "us-east-1"
  }
}