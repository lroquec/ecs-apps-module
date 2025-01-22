locals {
  common_tags = {
    Environment = "dev"
    ManagedBy   = "Terraform"
    CreatedBy   = "lroquec"
    Owner       = "DevOps Team"
  }
}

module "shared_networking" {
  source = "./modules/networking"

  vpc_name      = "shared-vpc"
  vpc_cidr      = "10.0.0.0/16"
  subnet_config = {
    subnet1 = {
      cidr_block = "10.0.1.0/24"
      public     = true
    }
    subnet2 = {
      cidr_block = "10.0.2.0/24"
      public     = true
    }
    subnet3 = {
      cidr_block = "10.0.3.0/24"
      public     = false
    }
    subnet4 = {
      cidr_block = "10.0.4.0/24"
      public     = false
    }
  }
  tags = local.common_tags
}

module "shared_infrastructure" {
  source = "./modules/ecs-cluster"

  cluster_name   = "myECSCluster"
  vpc_id         = module.shared_networking.vpc_id
  public_subnets = module.shared_networking.public_subnets
  tags          = local.common_tags

  depends_on = [module.shared_networking]
}

module "flask_app" {
  source           = "./modules/ecs-app"
  project_name     = "testing-ground"
  container_image  = "lroquec/cicd-tests:latest"
  service_name     = "myflaskapp"
  ecs_cluster_name = module.shared_infrastructure.cluster_name
  cluster_id       = module.shared_infrastructure.cluster_id
  container_port   = 5000
  vpc_id           = module.shared_networking.vpc_id
  private_subnets  = module.shared_networking.private_subnets
  alb_arn          = module.shared_infrastructure.alb_arn
  alb_dns_name     = module.shared_infrastructure.alb_dns_name
  alb_zone_id      = module.shared_infrastructure.alb_zone_id
  alb_security_group_id = module.shared_infrastructure.alb_security_group_id
  listener_arn     = module.shared_infrastructure.listener_arn
  health_check_command = ["CMD-SHELL", "curl -f http://localhost:5000/ || exit 1"]
  tags            = local.common_tags

  depends_on = [module.shared_infrastructure]
}

module "nginx_app" {
  source           = "./modules/ecs-app"
  project_name     = "nginx"
  container_image  = "lroquec/system-info:latest"
  service_name     = "mynginxapp"
  ecs_cluster_name = module.shared_infrastructure.cluster_name
  cluster_id       = module.shared_infrastructure.cluster_id
  container_port   = 80
  vpc_id           = module.shared_networking.vpc_id
  private_subnets  = module.shared_networking.private_subnets
  alb_arn          = module.shared_infrastructure.alb_arn
  alb_dns_name     = module.shared_infrastructure.alb_dns_name
  alb_zone_id      = module.shared_infrastructure.alb_zone_id
  alb_security_group_id = module.shared_infrastructure.alb_security_group_id
  listener_arn     = module.shared_infrastructure.listener_arn
  health_check_command = ["CMD-SHELL", "curl -f http://localhost/ || exit 1"]
  tags            = local.common_tags

  depends_on = [module.shared_infrastructure]
}