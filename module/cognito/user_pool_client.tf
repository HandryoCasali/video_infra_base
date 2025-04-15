resource "aws_cognito_user_pool_client" "main" {
  name                      = var.client_name
  user_pool_id              = aws_cognito_user_pool.main.id
  generate_secret           = true
  
  explicit_auth_flows = [
    "ALLOW_REFRESH_TOKEN_AUTH",
    "ALLOW_USER_PASSWORD_AUTH",
    "ALLOW_ADMIN_USER_PASSWORD_AUTH",
    "ALLOW_CUSTOM_AUTH",
    "ALLOW_USER_SRP_AUTH"
  ]

  supported_identity_providers = ["COGNITO"]
}