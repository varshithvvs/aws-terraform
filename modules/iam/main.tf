# Creates a iam poloicy for ecs fargate with load balancer

resource "aws_iam_policy" "ecs_fargate_lb_policy" {
  name        = "ecs_fargate_lb_policy"
  path        = "/"
  description = "Policy for ECS Fargate with Load Balancer"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "ecs:CreateCluster",
        "ecs:DeregisterTaskDefinition",
        "ecs:DescribeClusters",
        "ecs:DescribeTaskDefinition",
        "ecs:DescribeTasks",
        "ecs:ListClusters",
        "ecs:ListTaskDefinitions",
        "ecs:ListTasks",
        "ecs:RegisterTaskDefinition",
        "ecs:RunTask",
        "ecs:StartTask",
        "ecs:StopTask",
        "ecs:UpdateService",
        "elasticloadbalancing:*",
        "iam:PassRole",
        "logs:CreateLogGroup",
        "logs:CreateLogStream",
        "logs:PutLogEvents",
        "logs:DescribeLogStreams"
      ],
      "Effect": "Allow",
      "Resource": "*"
    }
  ]
}
EOF
}

#Create a iam role for ECS deployment with Load Balancer
resource "aws_iam_role" "ecs_fargate_role" {
  name = var.iam_role_name
  assume_role_policy = jsonencode(
    {
      Version = "2012-10-17"
      Statement = [
        {
          Action = "sts:AssumeRole"
          Effect = "Allow"
          Sid    = ""
          Principal = {
            Service = [
              "ecs-tasks.amazonaws.com",
              "ecs.amazonaws.com",
              "elasticloadbalancing.amazonaws.com",
              "ec2.amazonaws.com",
              "cloudwatch.amazonaws.com",
              "cognito-idp.amazonaws.com",
              "ecr.amazonaws.com",
              "vpc.amazonaws.com",
            ]
          }
        },
      ]
    }

  )
}

resource "aws_iam_role_policy_attachment" "ecs_fargate_lb_policy_attachment" {
  role       = aws_iam_role.ecs_fargate_role.name
  policy_arn = aws_iam_policy.ecs_fargate_lb_policy.arn
}