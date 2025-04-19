data "archive_file" "lambda" {
  type        = "zip"
  source_file = "${path.module}/lambda_function.py"
  output_path = "${path.module}/lambda_code.zip"
}

resource "aws_lambda_function" "auth_lambda" {
  function_name = var.lambda_name
  description   = "Lambda para autenticação de usuários no Cognito"
  runtime       = var.lambda_runtime
  handler       = var.lambda_handler
  role          = "arn:aws:iam::${var.account_id}:role/LabRole"
  filename      = "${path.module}/lambda_code.zip"

  source_code_hash = data.archive_file.lambda.output_base64sha256

  memory_size   = 128
  timeout       = 10

  environment {
    variables = {
      COGNITO_CLIENT_ID     = var.cognito_client_id
      COGNITO_CLIENT_SECRET = var.cognito_client_secret
      COGNITO_USER_POOL_ID  = var.cognito_user_pool_id
    }
  }
}