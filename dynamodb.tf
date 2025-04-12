resource "aws_dynamodb_table" "videos" {
  name         = "videos"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "usuario_id"
  range_key    = "video_id"

  attribute {
    name = "usuario_id"
    type = "S"
  }

  attribute {
    name = "video_id"
    type = "S"
  }

  tags = {
    Name = "videos-table"
  }
}
