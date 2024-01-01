output "ecr_repository_name" {
  value       = aws_ecr_repository.ecr.name
  description = "Name of the ECR repository created"
}