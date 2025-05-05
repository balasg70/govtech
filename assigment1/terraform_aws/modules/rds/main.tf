resource "aws_db_subnet_group" "default" {
  name = "${var.project}-db-subnet-group"
  subnet_ids = var.subnet_ids
  tags = { Name = "${var.project}-db-subnet-group" }
}

resource "aws_db_instance" "default" {
  identifier = "${var.project}-db"
  engine = "mysql"
  instance_class = var.instance_class
  allocated_storage = var.allocated_storage
  name = var.db_name
  username = var.username
  password = var.password
  db_subnet_group_name = aws_db_subnet_group.default.name
  vpc_security_group_ids = var.security_group_ids
  multi_az = true
  publicly_accessible = false
  skip_final_snapshot = true
}