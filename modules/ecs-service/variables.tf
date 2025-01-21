variable "service_name" {
  description = "Name of the ECS service and task definition"
  type        = string
}

variable "cluster_name" {
  description = "Name of the ECS cluster"
  type        = string
}

variable "cluster_id" {
  description = "ID of the ECS cluster"
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

variable "alb_security_group_id" {
  description = "Security group ID of the ALB"
  type        = string
}

variable "alb_arn" {
  description = "ARN of the ALB"
  type        = string
}

variable "container_image" {
  description = "Docker image to run in the ECS cluster"
  type        = string
}

variable "container_port" {
  description = "Port exposed by the docker image"
  type        = number
}

variable "health_check_path" {
  description = "Path for ALB health check"
  type        = string
  default     = "/"
}

variable "health_check_command" {
  description = "Command for container health check"
  type        = list(string)
  default     = null
}

variable "task_cpu" {
  description = "CPU units for the task (1024 = 1 CPU)"
  type        = number
  default     = 256
}

variable "task_memory" {
  description = "Memory for the task (in MiB)"
  type        = number
  default     = 512
}

variable "desired_count" {
  description = "Number of instances of the task to run"
  type        = number
  default     = 1
}

variable "log_retention_days" {
  description = "Number of days to retain CloudWatch logs"
  type        = number
  default     = 7
}

variable "tags" {
  description = "Tags to apply to all resources"
  type        = map(string)
  default     = {}
}

variable "domain_zone_name" {
  description = "The name of the hosted zone in Route53"
  type        = string
}

variable "subdomain" {
  description = "The subdomain for the service"
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