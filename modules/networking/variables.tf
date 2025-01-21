variable "vpc_name" {
  description = "Name of the VPC"
  type        = string
}

variable "vpc_cidr" {
  description = "The CIDR block for the VPC"
  type        = string

  validation {
    condition     = can(cidrnetmask(var.vpc_cidr))
    error_message = "The VPC CIDR block is not a valid CIDR block"
  }
}

variable "subnet_config" {
  type = map(object({
    cidr_block = string
    public     = optional(bool, false)
  }))

  validation {
    condition = alltrue([
      for config in values(var.subnet_config) : can(cidrnetmask(config.cidr_block))
    ])
    error_message = "The cidr_block config option must contain a valid CIDR block."
  }
}

variable "tags" {
  description = "Tags to apply to all resources"
  type        = map(string)
  default     = {}
}