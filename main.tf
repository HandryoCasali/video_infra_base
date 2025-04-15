terraform {
  required_version = ">= 1.3.0"

  backend "s3" {
    bucket = "terraform-state-fiapx"
    key    = "infra-core/terraform.tfstate"
    region = "us-east-1"
  }
}

provider "aws" {
  region = "us-east-1"
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
    source = "./module/apigtw"
    public_subnets = module.network.public_subnets
    alb_sg = module.alb.alb_sg
    alb_listener_arn = module.alb.alb_listener_arn
}

module "database" {
    source = "./module/database"
    s3_object_created_arn = module.sqs.s3_object_created_arn
    aws_account_id = data.aws_caller_identity.current.account_id
}

module "sqs" {
    source = "./module/sqs"
    bucket_arn = module.database.bucket_arn
    aws_account_id = data.aws_caller_identity.current.account_id
}

module "ecr" {
  source = "./module/ecr"
}

module "ecs" {
  source = "./module/ecs"
}