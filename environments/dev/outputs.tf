output "vpc_id" {
  value = module.networking.vpc_id
}

output "public_subnet_ids" {
  value = module.networking.public_subnet_ids
}

output "private_app_subnet_ids" {
  value = module.networking.private_app_subnet_ids
}

output "private_db_subnet_ids" {
  value = module.networking.private_db_subnet_ids
}
output "beanstalk_url" {
  value = module.elastic_beanstalk.environment_url
}
output "artifact_bucket_name" {
  value = module.artifacts.bucket_name
}