output "s3_object_created_arn" {
  value = aws_sqs_queue.s3_object_created.arn
}

output "queue_video_uploaded_url" {
  value = aws_sqs_queue.video_uploaded.id
}

output "queue_notification_url" {
  value = aws_sqs_queue.notification.id
}

output "queue_s3_object_created_url" {
  value = aws_sqs_queue.s3_object_created.id
}