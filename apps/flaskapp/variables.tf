variable "project_name" {
  description = "The name of the project"
  type        = string
}

variable "vpc_cidr" {
  description = "The CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "subnet_config" {
  type = map(object({
    cidr_block = string
    public     = optional(bool, false)
  }))

  default = {
    subnet1 = {
      cidr_block = "10.0.1.0/24"
      public     = true
    }
    subnet2 = {
      cidr_block = "10.0.2.0/24"
      public     = true
    }
    subnet3 = {
      cidr_block = "10.0.100.0/24"
      public     = false
    }
    subnet4 = {
      cidr_block = "10.0.101.0/24"
      public     = false
    }
  }
}

variable "container_image" {
  description = "The container image to use"
  type        = string
}

variable "container_port" {
  description = "The port the container listens on"
  type        = number
}

variable "ecs_cluster_name" {
  description = "Name of the ECS cluster"
  type        = string
}

variable "ecs_service_name" {
  description = "Name of the ECS service"
  type        = string
}

locals {
  common_tags = {
    Environment = "dev"
    Project     = var.project_name
    ManagedBy   = "Terraform"
  }
}