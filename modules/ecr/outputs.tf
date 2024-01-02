output "ecr_repository_name" {
  value       = aws_ecr_repository.ecr.name
  description = "Name of the ECR repository created"
}

output "ecr_repository_url" {
  value       = aws_ecr_repository.ecr.repository_url
  description = "URL of the ECR repository created"
}
