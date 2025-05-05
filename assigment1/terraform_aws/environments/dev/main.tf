module "vpc" {
  source = "../../modules/vpc"
  project = "symbiosis"
  vpc_cidr = "10.0.0.0/16"
  public_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnets = ["10.0.3.0/24", "10.0.4.0/24"]
  azs = ["us-east-1a", "us-east-1b"]
}

module "ec2" {
  source = "../../modules/ec2"
  project = "symbiosis"
  ami_id = "ami-0c94855ba95c71c99"
  instance_type = "t3.micro"
  key_name = "symbiosis-key"
  security_group_ids = [aws_security_group.ec2_sg.id]
  subnet_ids = module.vpc.public_subnet_ids
  min_size = 2
  max_size = 4
  desired_capacity = 2
}

module "rds" {
  source = "../../modules/rds"
  project = "symbiosis"
  subnet_ids = module.vpc.private_subnet_ids
  instance_class = "db.t3.micro"
  allocated_storage = 20
  db_name = "symbiosisdb"
  username = "admin"
  password = "password123"
  security_group_ids = [aws_security_group.rds_sg.id]
}

module "alb" {
  source = "../../modules/alb"
  project = "symbiosis"
  security_group_ids = [aws_security_group.alb_sg.id]
  subnet_ids = module.vpc.public_subnet_ids
  vpc_id = module.vpc.vpc_id
}