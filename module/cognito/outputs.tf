output "user_pool_id" {
  value = aws_cognito_user_pool.main.id
}

output "user_pool_endpoint" {
  value = aws_cognito_user_pool.main.endpoint
}

output "client_id" {
  value = aws_cognito_user_pool_client.main.id
}

output "client_secret" {
  value = aws_cognito_user_pool_client.main.client_secret
}

output "domain_url" {
  value = "https://${aws_cognito_user_pool_domain.main.domain}.auth.${var.aws_region}.amazoncognito.com"
}
