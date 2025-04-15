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

resource "aws_ecr_repository" "storage_service" {
  name = "storage-service"
  force_delete = true
  image_scanning_configuration {
    scan_on_push = true
  }

  image_tag_mutability = "MUTABLE"

  tags = {
    Name = "storage-service-ecr"
  }
}

resource "aws_ecr_repository" "video_process_service" {
  name = "video-process-service"
  force_delete = true
  image_scanning_configuration {
    scan_on_push = true
  }

  image_tag_mutability = "MUTABLE"

  tags = {
    Name = "video-process-service-ecr"
  }
}