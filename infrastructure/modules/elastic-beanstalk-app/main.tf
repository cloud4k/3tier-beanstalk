resource "aws_elastic_beanstalk_application" "this" {
  name        = var.application_name
  description = "PHP 8 Nginx 3-tier Elastic Beanstalk application"
}