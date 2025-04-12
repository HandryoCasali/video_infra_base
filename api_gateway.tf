resource "aws_apigatewayv2_api" "http_api" {
  name          = "video-http-api"
  protocol_type = "HTTP"
}

resource "aws_apigatewayv2_vpc_link" "alb_link" {
  name               = "alb-vpc-link"
  subnet_ids         = aws_subnet.public[*].id
  security_group_ids = [aws_security_group.alb_sg.id]
}

resource "aws_apigatewayv2_integration" "alb_integration" {
  api_id             = aws_apigatewayv2_api.http_api.id
  integration_type   = "HTTP_PROXY"
  integration_method = "ANY"
  integration_uri = aws_lb_listener.http.arn
  connection_type    = "VPC_LINK"
  connection_id      = aws_apigatewayv2_vpc_link.alb_link.id
  payload_format_version = "1.0"
}

resource "aws_apigatewayv2_route" "any_route" {
  api_id    = aws_apigatewayv2_api.http_api.id
  route_key = "ANY /{proxy+}"
  target    = "integrations/${aws_apigatewayv2_integration.alb_integration.id}"
}

resource "aws_apigatewayv2_stage" "default" {
  api_id      = aws_apigatewayv2_api.http_api.id
  name        = "$default"
  auto_deploy = true
}