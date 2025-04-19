terraform {
  required_version = ">= 1.3.0"

  backend "s3" {
    bucket = "561266514983-terraform-state-fiapx"
    key    = "infra-core/terraform.tfstate"
    region = "us-east-1"
  }
}

provider "aws" {
  region = var.aws_region
}

module "network" {
  source = "./module/network"

  vpc_cidr             = var.vpc_cidr
  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
}

module "alb" {
  source = "./module/alb"

  public_subnets = module.network.public_subnets
  vpc_id         = module.network.vpc_id
}

module "apigtw" {
  source            = "./module/apigtw"
  public_subnets    = module.network.public_subnets
  alb_sg            = module.alb.alb_sg
  alb_listener_arn  = module.alb.alb_listener_arn
  aws_region        = var.aws_region
  lambda_arn        = module.lambda.lambda_arn
  lambda_invoke_arn = module.lambda.lambda_invoke_arn

  cognito_client_id    = module.cognito.client_id
  cognito_user_pool_id = module.cognito.user_pool_id
}

module "database" {
  source                = "./module/database"
  s3_object_created_arn = module.sqs.s3_object_created_arn
  aws_account_id        = data.aws_caller_identity.current.account_id
}

module "sqs" {
  source         = "./module/sqs"
  bucket_arn     = module.database.bucket_arn
  aws_account_id = data.aws_caller_identity.current.account_id
}

module "ecr" {
  source = "./module/ecr"
}

module "ecs" {
  source = "./module/ecs"
}

module "lambda" {
  source         = "./module/lambda"
  lambda_name    = var.lambda_name
  lambda_handler = var.lambda_handler
  lambda_runtime = var.lambda_runtime

  account_id = data.aws_caller_identity.current.account_id

  cognito_client_id     = module.cognito.client_id
  cognito_client_secret = module.cognito.client_secret
  cognito_user_pool_id  = module.cognito.user_pool_id

}

module "cognito" {
  source = "./module/cognito"

  user_pool_name   = var.user_pool_name
  client_name      = var.client_name
  domain_name      = var.domain_name
  oauth_flows      = var.oauth_flows
  oauth_scopes     = var.oauth_scopes
  tags             = var.tags
  username_example = var.username_example
  password_example = var.password_example
  aws_region       = var.aws_region
}