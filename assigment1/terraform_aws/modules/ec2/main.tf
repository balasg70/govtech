resource "aws_launch_template" "app" {
  name_prefix = "${var.project}-lt-"
  image_id = var.ami_id
  instance_type = var.instance_type
  key_name = var.key_name
  user_data = base64encode(file("${path.module}/user_data.sh"))
  vpc_security_group_ids = var.security_group_ids
}

resource "aws_autoscaling_group" "app" {
  name = "${var.project}-asg"
  max_size = var.max_size
  min_size = var.min_size
  desired_capacity = var.desired_capacity
  vpc_zone_identifier = var.subnet_ids
  launch_template {
    id = aws_launch_template.app.id
    version = "$Latest"
  }
  tag {
    key = "Name"
    value = "${var.project}-ec2"
    propagate_at_launch = true
  }
}