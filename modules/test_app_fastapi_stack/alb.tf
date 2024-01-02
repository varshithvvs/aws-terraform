# Create required Security Groups for ALB
resource "aws_security_group" "ecs_lb_sg" {
  name        = "${var.project_name}-ecs-lb-sg"
  description = "Security group for ECS load balancer to allow traffic from internet to the ECS service"
  vpc_id      = var.vpc_id
}

# Ingress rule to allow traffic from internet to the ECS service
resource "aws_vpc_security_group_ingress_rule" "ecs_lb_sg_ingress_rule" {
  ip_protocol       = "tcp"
  security_group_id = aws_security_group.ecs_lb_sg.id
  description       = "Allow traffic from internet to the ECS service"
  from_port         = 80
  to_port           = 80
  cidr_ipv4         = "0.0.0.0/0"
}

# Egress rule to allow traffic from ECS service to internet
resource "aws_vpc_security_group_egress_rule" "ecs_lb_sg_egress_rule" {
  ip_protocol       = "-1"
  security_group_id = aws_security_group.ecs_lb_sg.id
  description       = "Allow traffic from ECS service to internet"
  cidr_ipv4         = "0.0.0.0/0"
}

# ======================================================================================================================

# Creates Application Load Balancer for the ECS service
resource "aws_lb" "ecs_lb" {
  name               = "${var.project_name}-ecs-lb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.ecs_lb_sg.id]
  subnets            = [var.public_subnet_id]
}

# Create Target Group for the ECS service
resource "aws_lb_target_group" "ecs_lb_tg" {
  name     = "${var.project_name}-ecs-lb-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id
  tags     = var.default_tags

  health_check {
    path                = "/"
    port                = "traffic-port"
    protocol            = "HTTP"
    matcher             = "200-399"
    interval            = 10
    timeout             = 50
    healthy_threshold   = 2
    unhealthy_threshold = 2
  }
}

# Create http listener for the ALB
resource "aws_lb_listener" "ecs_lb_listener" {
  load_balancer_arn = aws_lb.ecs_lb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.ecs_lb_tg.arn
  }
}
