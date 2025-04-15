variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "public_subnet_cidrs" {
  default = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnet_cidrs" {
  default = ["10.0.3.0/24", "10.0.4.0/24"]
}

variable "aws_region" {
  default = "us-east-1"
}

############## - LAMBDA - ##################
variable "lambda_name" {
  description = "Nome da função Lambda"
  type        = string
  default     = "authorizer_cognito"
}

variable "lambda_handler" {
  description = "Nome do estágio da API (ex: 'dev', 'prod')"
  type        = string
  default     = "lambda_function.lambda_handler"
}

variable "lambda_runtime" {
  description = "Linguagem de execução da função Lambda"
  type        = string
  default     = "python3.12"
}


############## - COGNITO - ##################
variable "user_pool_name" {
  description = "Nome do Cognito User Pool"
  type        = string
  default     = "Tech-Challenge-User-Pool"
}

variable "client_name" {
  description = "Nome do App Client do Cognito"
  type        = string
  default     = "Tech-Challenge-App-Client"
}

variable "domain_name" {
  description = "Prefixo do domínio para o Cognito"
  type        = string
  default     = "tech-challenge-process-video"
}

variable "oauth_flows" {
  description = "Fluxos OAuth permitidos"
  type        = list(string)
  default     = ["client_credentials"]
}

variable "oauth_scopes" {
  description = "Escopos OAuth permitidos"
  type        = list(string)
  default     = ["aws.cognito.signin.user.admin"]
}

variable "tags" {
  description = "Tags para os recursos"
  type        = map(string)
  default = {
    "Environment" = "dev"
    "Project"     = "MyProject"
  }
}

variable "username_example" {
  default = "luishcarreira"
}

variable "password_example" {
  default = "Lh@123456"
}