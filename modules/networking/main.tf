locals {
  private_subnets_cidr = [for k, v in var.subnet_config : v.cidr_block if !v.public]
  public_subnets_cidr  = [for k, v in var.subnet_config : v.cidr_block if v.public]
}

data "aws_availability_zones" "azs" {
  state = "available"
}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.5.3"

  name                    = var.vpc_name
  cidr                    = var.vpc_cidr
  azs                     = data.aws_availability_zones.azs.names
  private_subnets         = local.private_subnets_cidr
  public_subnets          = local.public_subnets_cidr
  map_public_ip_on_launch = true
  enable_nat_gateway      = true
  single_nat_gateway      = true

  tags = var.tags
}