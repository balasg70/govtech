variable "project" {}
variable "subnet_ids" { type = list(string) }
variable "instance_class" {}
variable "allocated_storage" {}
variable "db_name" {}
variable "username" {}
variable "password" {}
variable "security_group_ids" { type = list(string) }