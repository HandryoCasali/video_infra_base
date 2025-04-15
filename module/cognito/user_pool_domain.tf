resource "aws_cognito_user_pool_domain" "main" {
  domain       = var.domain_name
  user_pool_id = aws_cognito_user_pool.main.id
}