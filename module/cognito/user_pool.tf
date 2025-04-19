resource "aws_cognito_user_pool" "main" {
  name = var.user_pool_name

  password_policy {
    minimum_length    = 8
    require_lowercase = true
    require_numbers   = true
    require_symbols   = false
    require_uppercase = true
  }

  auto_verified_attributes = ["email"]
  mfa_configuration         = "OFF"

  tags = var.tags
}

# Usuario de exemplo
resource "aws_cognito_user" "example" {
  user_pool_id = aws_cognito_user_pool.main.id
  enabled      = true
  
  username = var.username_example
  password = var.password_example
}
