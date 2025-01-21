module "networking" {
  source = "../../modules/networking"
  
  vpc_name   = "${var.project_name}-vpc"
  vpc_cidr   = var.vpc_cidr
  subnet_config = var.subnet_config
  tags       = local.common_tags
}

module "cluster" {
  source = "../../modules/cluster"
  
  cluster_name    = var.ecs_cluster_name
  vpc_id         = module.networking.vpc_id
  public_subnets = module.networking.public_subnets
  tags           = local.common_tags
}

module "flask_service" {
  source = "../../modules/service"
  
  service_name         = var.ecs_service_name
  cluster_name        = module.cluster.cluster_name
  cluster_id          = module.cluster.cluster_id
  vpc_id             = module.networking.vpc_id
  private_subnets    = module.networking.private_subnets
  alb_security_group_id = module.cluster.alb_security_group_id
  alb_arn            = module.cluster.alb_arn
  
  container_image     = var.container_image
  container_port      = var.container_port
  health_check_command = ["CMD-SHELL", "curl -f http://localhost:${var.container_port}/ || exit 1"]

  domain_zone_name = "lroquec.com"
  subdomain        = var.ecs_service_name
  alb_dns_name     = module.cluster.alb_dns_name
  alb_zone_id      = module.cluster.alb_zone_id
  
  tags               = local.common_tags
}