resource "aws_sqs_queue" "s3_object_created" {
  name = "s3_object_created"
}

resource "aws_sqs_queue" "video_uploaded" {
  name = "video_uploaded"
}

resource "aws_sqs_queue" "notification" {
  name = "notification"
}
