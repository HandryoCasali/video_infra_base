resource "aws_apigatewayv2_api" "http_api" {
  name          = "video-http-api"
  protocol_type = "HTTP"
}

resource "aws_apigatewayv2_vpc_link" "alb_link" {
  name               = "alb-vpc-link"
  subnet_ids         = var.public_subnets
  security_group_ids = [var.alb_sg.id]
}

resource "aws_apigatewayv2_integration" "alb_integration" {
  api_id             = aws_apigatewayv2_api.http_api.id
  integration_type   = "HTTP_PROXY"
  integration_method = "ANY"
  integration_uri    = var.alb_listener_arn
  connection_type    = "VPC_LINK"
  connection_id      = aws_apigatewayv2_vpc_link.alb_link.id
  payload_format_version = "1.0"
  
  #add userId
  request_parameters = {
    "append:header.usuarioId" = "$context.authorizer.claims.username",
    "append:header.userId" = "$context.authorizer.claims.username",
  }
}

resource "aws_apigatewayv2_route" "any_route" {
  api_id    = aws_apigatewayv2_api.http_api.id
  route_key = "ANY /{proxy+}"
  target    = "integrations/${aws_apigatewayv2_integration.alb_integration.id}"
  # Auth
  authorizer_id = aws_apigatewayv2_authorizer.cognito_authorizer.id
  authorization_type = "JWT"
}

resource "aws_apigatewayv2_stage" "default" {
  api_id      = aws_apigatewayv2_api.http_api.id
  name        = "$default"
  auto_deploy = true
}