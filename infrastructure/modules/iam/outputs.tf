output "beanstalk_service_role_name" {
  value = aws_iam_role.beanstalk_service_role.name
}

output "beanstalk_instance_profile_name" {
  value = aws_iam_instance_profile.beanstalk_instance_profile.name
}