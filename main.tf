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
    source = "./network"

    vpc_cidr = var.vpc_cidr
    public_subnet_cidrs = var.public_subnet_cidrs
    private_subnet_cidrs = var.private_subnet_cidrs
    
}