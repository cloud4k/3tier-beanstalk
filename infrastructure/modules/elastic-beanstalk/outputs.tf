output "application_name" {
  value = aws_elastic_beanstalk_application.this.name
}

output "app_security_group_id" {
  value = aws_security_group.beanstalk_app.id
}
output "environment_url" {
  value = aws_elastic_beanstalk_environment.this.endpoint_url
}