resource "aws_apigatewayv2_authorizer" "cognito_authorizer" {
  api_id         = aws_apigatewayv2_api.http_api.id
  authorizer_type = "JWT"
  identity_sources = ["$request.header.Authorization"]
  name            = "example-authorizer"

  jwt_configuration {
    audience = [var.cognito_client_id]
    issuer   = "https://cognito-idp.${var.aws_region}.amazonaws.com/${var.cognito_user_pool_id}"
  }
}

resource "aws_apigatewayv2_integration" "lambda_integration" {
  api_id             = aws_apigatewayv2_api.http_api.id
  integration_type   = "AWS_PROXY"
  integration_uri    = var.lambda_invoke_arn
}

resource "aws_apigatewayv2_route" "lambda_route" {
  api_id    = aws_apigatewayv2_api.http_api.id
  route_key = "POST /admin/token"
  target    = "integrations/${aws_apigatewayv2_integration.lambda_integration.id}"
}
