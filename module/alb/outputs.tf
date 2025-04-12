output "alb_dns_name" {
  value = aws_lb.main.dns_name
}

output "alb_arn" {
  value = aws_lb.main.arn
}

output "alb_listener_arn" {
  value = aws_lb_listener.http.arn
}

output "alb_sg" {
  value = aws_security_group.alb_sg
}