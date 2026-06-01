module "networking" {
  source = "../../infrastructure/modules/networking"

  project_name = var.project_name
  vpc_cidr     = var.vpc_cidr
}

module "iam" {
  source = "../../infrastructure/modules/iam"

  project_name = var.project_name
}

module "rds" {
  source = "../../infrastructure/modules/rds"

  project_name          = var.project_name
  vpc_id                = module.networking.vpc_id
  private_db_subnet_ids = module.networking.private_db_subnet_ids
  app_security_group_ids = [
    module.beanstalk_blue.app_security_group_id,
    module.beanstalk_green.app_security_group_id
  ]
  db_name     = var.db_name
  db_username = var.db_username
  db_password = var.db_password
}
module "beanstalk_app" {
  source = "../../infrastructure/modules/elastic-beanstalk-app"

  application_name = var.application_name
}

module "beanstalk_blue" {
  source = "../../infrastructure/modules/elastic-beanstalk-env"

  project_name                    = var.project_name
  vpc_id                          = module.networking.vpc_id
  public_subnet_ids               = module.networking.public_subnet_ids
  private_app_subnet_ids          = module.networking.private_app_subnet_ids
  application_name                = module.beanstalk_app.application_name
  environment_name                = var.environment_name
  instance_type                   = var.instance_type
  beanstalk_service_role_name     = module.iam.beanstalk_service_role_name
  beanstalk_instance_profile_name = module.iam.beanstalk_instance_profile_name
  security_group_name             = "${var.project_name}-beanstalk-app-sg"

  db_host     = module.rds.db_endpoint
  db_name     = var.db_name
  db_user     = var.db_username
  db_password = var.db_password
}

module "beanstalk_green" {
  source = "../../infrastructure/modules/elastic-beanstalk-env"

  project_name                    = var.project_name
  vpc_id                          = module.networking.vpc_id
  public_subnet_ids               = module.networking.public_subnet_ids
  private_app_subnet_ids          = module.networking.private_app_subnet_ids
  application_name                = module.beanstalk_app.application_name
  environment_name                = "3tier-beanstalk-green"
  instance_type                   = var.instance_type
  beanstalk_service_role_name     = module.iam.beanstalk_service_role_name
  beanstalk_instance_profile_name = module.iam.beanstalk_instance_profile_name
  security_group_name             = "3tier-beanstalk-green-beanstalk-app-sg"

  db_host     = module.rds.db_endpoint
  db_name     = var.db_name
  db_user     = var.db_username
  db_password = var.db_password
}
module "artifacts" {
  source = "../../infrastructure/modules/artifacts"

  project_name = var.project_name
}