resource "aws_s3_bucket" "meu_bucket" {
  bucket = "${data.aws_caller_identity.current.account_id}-video-storage-bucket" 
}

resource "aws_s3_bucket_notification" "bucket_notification" {
  bucket = aws_s3_bucket.meu_bucket.id

  queue {
    queue_arn     = aws_sqs_queue.s3_object_created.arn
    events        = ["s3:ObjectCreated:Put", "s3:ObjectCreated:Post"]
    filter_suffix = ".mp4"  # Opcional: filtrar apenas arquivos .mp4
  }

  depends_on = [ aws_sqs_queue.s3_object_created ]
}