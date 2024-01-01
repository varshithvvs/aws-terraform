# Pull iam role arn from data source
data "iam_role" "iam_role_for_ecs" {
  name = var.iam_role_name
}

# Pull ECS Load Balancer arn from data source
data "aws_lb" "ecs_lb" {
  name = var.ecs_lb_name
  arn  = var.ecs_lb_arn
}

data "aws_security_group" "lb_for_ecs" {
  id = var.security_group_id
}

# Lists the subnets of the load balancer
data "aws_subnet" "ecs_public_subnet" {
  id = var.public_subnet_id
}