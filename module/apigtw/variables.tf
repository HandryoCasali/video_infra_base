variable "aws_region" {}
variable "public_subnets" {
  type = list(string)
}

variable "alb_sg" {}
variable "alb_listener_arn" {}

variable "lambda_arn" { }

variable "lambda_invoke_arn" { }

variable "cognito_client_id" { }

variable "cognito_user_pool_id" { }
