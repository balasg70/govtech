variable "project" {}
variable "ami_id" {}
variable "instance_type" {}
variable "key_name" {}
variable "security_group_ids" { type = list(string) }
variable "subnet_ids" { type = list(string) }
variable "min_size" {}
variable "max_size" {}
variable "desired_capacity" {}