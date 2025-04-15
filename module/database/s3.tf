resource "aws_s3_bucket" "meu_bucket" {
  bucket = "${var.aws_account_id}-video-storage-bucket" 
  force_destroy = true
}

resource "aws_s3_bucket_notification" "bucket_notification" {
  bucket = aws_s3_bucket.meu_bucket.id

  queue {
    queue_arn     = var.s3_object_created_arn
    events        = ["s3:ObjectCreated:Put", "s3:ObjectCreated:Post"]
    filter_suffix = ".mp4"
  }
}