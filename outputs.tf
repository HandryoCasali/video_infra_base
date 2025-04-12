output "vpc_id" {
  value = aws_vpc.main.id
}

output "private_subnets" {
  value = var.private_subnets
}

output "public_subnets" {
  value = var.public_subnets
}

output "queue_s3_object_created_url" {
  value = aws_sqs_queue.s3_object_created.id
}

output "s3_object_created_name" {
  value = aws_s3_bucket.meu_bucket.bucket_domain_name
}

output "queue_video_uploaded_url" {
  value = aws_sqs_queue.video_uploaded.id
}

output "queue_notification_url" {
  value = aws_sqs_queue.notification.id
}

output "dynamodb_table_name" {
  value = aws_dynamodb_table.videos.name
}

output "alb_dns_name" {
  value = aws_lb.main.dns_name
}

output "alb_arn" {
  value = aws_lb.main.arn
}

output "api_gtw_url" {
  value = aws_apigatewayv2_api.http_api.api_endpoint
}

output "video_cluster_name"{
    value = aws_ecs_cluster.video_cluster.name
}