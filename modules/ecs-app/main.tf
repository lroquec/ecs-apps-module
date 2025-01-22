module "app_service" {
  source = "../ecs-service"

  service_name          = var.service_name
  cluster_name         = var.ecs_cluster_name
  cluster_id           = data.aws_ecs_cluster.cluster.id
  vpc_id               = var.vpc_id
  private_subnets      = var.private_subnets
  alb_security_group_id = var.alb_security_group_id
  alb_arn              = var.alb_arn
  container_image      = var.container_image
  container_port       = var.container_port
  health_check_command = var.health_check_command
  domain_zone_name     = "lroquec.com"
  subdomain            = var.service_name
  alb_dns_name         = var.alb_dns_name
  alb_zone_id          = var.alb_zone_id
  listener_arn = var.listener_arn
  tags                 = var.tags
}

data "aws_ecs_cluster" "cluster" {
  cluster_name = var.ecs_cluster_name
}