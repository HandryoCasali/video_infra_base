output "vpc_id" {
  value = module.network.vpc_id
}

output "public_subnets" {
  value = module.network.public_subnets
}

output "private_subnets" {
  value = module.network.private_subnets
}

output "alb_arn" {
  value = module.alb.alb_arn
}

output "alb_dns" {
  value = module.alb.alb_dns_name
}

output "apigtw_url" {
  value = module.apigtw.api_gtw_url
}

output "cognito_url" {
  value = module.cognito.domain_url
}


output "client_id" {
  value = module.cognito.client_id
  sensitive = true
}

output "client_secret" {
  value =  module.cognito.client_secret
  sensitive = true

}