resource "aws_sqs_queue" "s3_object_created" {
  name = "s3_object_created"
}

resource "aws_sqs_queue" "video_uploaded" {
  name = "video_uploaded"
}

resource "aws_sqs_queue" "notification" {
  name = "notification"
}

resource "aws_sqs_queue_policy" "s3_notification_policy" {
  queue_url = aws_sqs_queue.s3_object_created.id

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect    = "Allow",
        Principal = {
          Service = "s3.amazonaws.com"
        },
        Action    = "sqs:SendMessage",
        Resource  = aws_sqs_queue.s3_object_created.arn,
        Condition = {
          ArnLike = {
            "aws:SourceArn" = aws_s3_bucket.meu_bucket.arn
          },
          StringEquals = {
            "aws:SourceAccount" = data.aws_caller_identity.current.account_id
          }
        }
      }
    ]
  })

  depends_on = [ aws_s3_bucket.meu_bucket, aws_sqs_queue.s3_object_created ]
}