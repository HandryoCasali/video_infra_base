resource "aws_ecs_cluster" "video_cluster" {
  name = "video-cluster"
  setting {
    name  = "containerInsights"
    value = "enabled"
  }
}