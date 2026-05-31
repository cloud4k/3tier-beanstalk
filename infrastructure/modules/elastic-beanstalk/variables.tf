variable "project_name" {
  type = string
}

variable "vpc_id" {
  type = string
}

variable "public_subnet_ids" {
  type = list(string)
}

variable "private_app_subnet_ids" {
  type = list(string)
}

variable "application_name" {
  type = string
}

variable "environment_name" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "beanstalk_service_role_name" {
  type = string
}

variable "beanstalk_instance_profile_name" {
  type = string
}

variable "db_host" {
  type = string
}

variable "db_name" {
  type = string
}

variable "db_user" {
  type = string
}

variable "db_password" {
  type      = string
  sensitive = true
}