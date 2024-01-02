# Create ECR repository using the given id

# Creates the ECR repository
resource "aws_ecr_repository" "ecr" {
  name                 = var.aws_ecr_repository_name
  image_tag_mutability = "MUTABLE"
  image_scanning_configuration {
    scan_on_push = false
  }
}