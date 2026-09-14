# Deivi Motors Gateway

Infraestrutura Terraform para provisionar o **API Gateway HTTP (v2)** do serviço Deivi Motors na AWS.
Projeto da Pós Graduação FIAP de Arquitetura de Software.

## O que este repositório provisiona

- API Gateway HTTP chamado `deivi-motors-api-gtw`
- Stage `prod`
- Rotas definidas via `gateway/openapi.yaml`
- Integração com:
  - Lambda `AuthenticationFunctionDeiviMotors` (autenticação)
  - ALB `deivi-motors-alb` (rotas do service Deivi Motors)
  - Cognito (JWT authorizer via remote state)

## Dependências externas

- Credenciais AWS configuradas
- Terraform instalado
- Estado remoto S3:
  - bucket: `tfstate-infra-deivi-motors`
  - key (gateway): `infra-gateway-deivi-motors/terraform.tfstate`
  - key (cluster/outputs Cognito): `infra-terraform/terraform.tfstate`

## Como aplicar

Executar dentro de [gateway/](gateway/):

```bash
terraform init
terraform plan
terraform apply
```

## Outputs principais

- `api_gateway_id`
- `api_gateway_invoke_url`
- `aws_alb`