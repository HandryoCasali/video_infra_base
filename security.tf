resource "aws_security_group" "default_allow_all_outbound" {
  name        = "default-ecs-sg"
  description = "Allow all outbound"
  vpc_id      = aws_vpc.main.id

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "ecs-default-sg"
  }
}
