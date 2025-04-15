output "lambda_arn" {
  description = "ARN da função Lambda"
  value       = aws_lambda_function.auth_lambda.arn
}

output "lambda_invoke_arn" {
  description = "Invoke arn da função Lambda"
  value = aws_lambda_function.auth_lambda.invoke_arn
}