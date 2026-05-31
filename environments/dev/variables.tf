variable "project_name" {
  type    = string
  default = "3tier-beanstalk"
}

variable "aws_region" {
  type    = string
  default = "us-east-1"
}

variable "vpc_cidr" {
  type    = string
  default = "10.50.0.0/16"
}

variable "application_name" {
  type    = string
  default = "3tier-beanstalk-app"
}

variable "environment_name" {
  type    = string
  default = "3tier-beanstalk-dev"
}

variable "instance_type" {
  type    = string
  default = "t3.micro"
}

variable "db_name" {
  type    = string
  default = "studentdb"
}

variable "db_username" {
  type    = string
  default = "admin"
}

variable "db_password" {
  type      = string
  sensitive = true
}