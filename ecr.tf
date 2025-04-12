resource "aws_ecr_repository" "video_management" {
  name = "video-management"
  force_delete = true
  image_scanning_configuration {
    scan_on_push = true
  }

  image_tag_mutability = "MUTABLE"

  tags = {
    Name = "video-management-ecr"
  }
}