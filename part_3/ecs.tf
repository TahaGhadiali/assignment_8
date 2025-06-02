resource "aws_ecs_cluster" "main" {
  name = "app-cluster"
}

resource "aws_ecs_task_definition" "frontend" {
  family                   = "flask-task"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = "256"
  memory                   = "512"

  container_definitions = jsonencode([
    {
      name      = "frontend"
      image     = " "
      portMappings = [{
        containerPort = 5000
      }]
    }
  ])
  execution_role_arn = aws_iam_role.ecs_task_exec.arn
}

resource "aws_ecs_task_definition" "backend" {
  family                   = "express-task"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = "256"
  memory                   = "512"

  container_definitions = jsonencode([
    {
      name      = "backend"
      image     = " "
      portMappings = [{
        containerPort = 3000
      }]
    }
  ])
  execution_role_arn = aws_iam_role.ecs_task_exec.arn
}
