resource "aws_ecr_repository" "app" {
  name                 = "secure-cloud-devops-app"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }

  tags = {
    Name        = "secure-cloud-devops-ecr"
    Project     = "secure-cloud-devops-platform"
    Environment = "staging"
  }
}