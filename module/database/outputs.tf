output "bucket_arn" {
  value = aws_s3_bucket.meu_bucket.arn
}

output "s3_object_created_name" {
  value = aws_s3_bucket.meu_bucket.bucket_domain_name
}

output "dynamodb_table_name" {
  value = aws_dynamodb_table.videos.name
}
