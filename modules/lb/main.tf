# Creates a load balancer to manage traffic to the ECS service

resource "aws_lb" "lb_for_ecs" {
  name                       = var.aws_ecs_lb_name
  internal                   = false
  load_balancer_type         = "application"
  security_groups            = [data.aws_security_group.id]
  subnets                    = [data.aws_subnet.public_subnet.id]
  enable_deletion_protection = false
  tags                       = var.default_tags
}

#Creates load balancer target group

resource "aws_lb_target_group" "lb_for_ecs_target_group" {
  name                 = var.aws_ecs_lb_name
  port                 = 80
  protocol             = "HTTP"
  vpc_id               = data.aws_vpc.vpc.id
  target_type          = "ip"
  deregistration_delay = 10
  health_check {
    path                = "/"
    port                = "traffic-port"
    protocol            = "HTTP"
    matcher             = "200-399"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 2
    unhealthy_threshold = 2
  }
  tags = var.default_tags

}

#Creates load balancer listener

resource "aws_lb_listener" "lb_for_ecs_listener" {
  load_balancer_arn = aws_lb.lb_for_ecs.arn
  port              = 80
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.lb_for_ecs_target_group.arn
  }
}


#Create cognito authentication

# resource "aws_lb_listener_rule" "authenticate" {
#   listener_arn = aws_lb_listener.lb_for_ecs_listener.arn

#   action {
#     type = "authenticate-cognito"

#     authenticate_cognito {
#       user_pool_arn       = aws_cognito_user_pool.cognito.arn
#       user_pool_client_id = aws_cognito_user_pool_client.cognito.id
#       user_pool_domain    = aws_cognito_user_pool_domain.cognito.domain
#     }

#     order = 1
#   }

#   action {
#     type             = "forward"
#     target_group_arn = aws_lb_target_group.lb_for_ecs_target_group.arn
#     order            = 2
#   }

#   condition {
#     field  = "path-pattern"
#     values = ["/authenticated/*"]
#   }
# }