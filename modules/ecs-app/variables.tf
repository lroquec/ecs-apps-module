variable "project_name" {
  description = "Name of the project"
  type        = string
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

variable "service_name" {
  description = "Name of the ECS service"
  type        = string
}

variable "vpc_id" {
  description = "ID of the VPC"
  type        = string
}

variable "private_subnets" {
  description = "List of private subnet IDs"
  type        = list(string)
}

variable "alb_arn" {
  description = "ARN of the ALB"
  type        = string
}

variable "alb_dns_name" {
  description = "DNS name of the ALB"
  type        = string
}

variable "alb_zone_id" {
  description = "Zone ID of the ALB"
  type        = string
}

variable "alb_security_group_id" {
  description = "Security group ID of the ALB"
  type        = string
}

variable "health_check_command" {
  description = "Command for container health check"
  type        = list(string)
  default     = null
}

variable "tags" {
  description = "Tags to apply to resources"
  type        = map(string)
  default     = {}
}

variable "cluster_id" {
  description = "ID of the ECS cluster"
  type        = string
}

variable "listener_arn" {
  description = "ARN of the ALB listener"
  type        = string
}