# Loads a Security Group for the load balancer
data "aws_security_group" "lb_for_ecs" {
  id = var.security_group_id
}

# Loads vpc of the load balancer
data "aws_vpc" "vpc" {
  id = var.vpc_id

}

# Lists the subnets of the load balancer
data "aws_subnet" "public_subnet" {
  id = var.public_subnet_id
}