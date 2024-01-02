# This output represents the DNS name of the Application Load Balancer (ALB) associated with the ECS service.
output "alb_dns_name" {
  value = aws_lb.ecs_lb.dns_name
}
