resource "aws_lb" "app" {
  name = "${var.project}-alb"
  internal = false
  load_balancer_type = "application"
  security_groups = var.security_group_ids
  subnets = var.subnet_ids
}

resource "aws_lb_target_group" "app" {
  name = "${var.project}-tg"
  port = 80
  protocol = "HTTP"
  vpc_id = var.vpc_id
  health_check {
    path = "/"
    interval = 30
    timeout = 5
    healthy_threshold = 5
    unhealthy_threshold = 2
  }
}

resource "aws_lb_listener" "app" {
  load_balancer_arn = aws_lb.app.arn
  port = 80
  protocol = "HTTP"
  default_action {
    type = "forward"
    target_group_arn = aws_lb_target_group.app.arn
  }
}