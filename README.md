# AWS ECS Infrastructure Project

This Terraform project deploys a complete ECS infrastructure in AWS, including networking, cluster configuration, and multiple containerized applications.

## Architecture Overview

The infrastructure consists of:

- VPC with public and private subnets across multiple availability zones
- ECS Cluster running on Fargate
- Application Load Balancer (ALB) for traffic distribution
- Multiple containerized applications with automated deployment
- Route53 DNS configuration for each service

## Prerequisites

- Terraform >= 1.7.0
- AWS CLI configured with appropriate credentials
- Docker images pushed to repository
- Route53 hosted zone configured for domain `lroquec.com`
- S3 bucket `lroquec-tf` for Terraform state

## Project Structure

```
.
├── backend.tf          # S3 backend configuration
├── main.tf            # Main infrastructure definition
├── outputs.tf         # Project outputs
├── provider.tf        # AWS provider configuration
├── variables.tf       # Project variables
├── versions.tf        # Version constraints
└── modules/
    ├── networking/    # VPC and subnet configuration
    ├── ecs-cluster/  # ECS cluster and ALB setup
    ├── ecs-app/      # Application module
    └── ecs-service/  # ECS service configuration
```

## Deployed Applications

1. Flask Application
   - Container: `lroquec/cicd-tests:latest`
   - Port: 5000
   - URL: `myflaskapp.lroquec.com`

2. Nginx Application
   - Container: `lroquec/system-info:latest`
   - Port: 80
   - URL: `mynginxapp.lroquec.com`

## Network Configuration

- VPC CIDR: 10.0.0.0/16
- Public Subnets (with NAT Gateway):
  - 10.0.1.0/24
  - 10.0.2.0/24
- Private Subnets:
  - 10.0.3.0/24
  - 10.0.4.0/24

## Usage

1. Initialize Terraform:
```bash
terraform init
```

2. Review the changes:
```bash
terraform plan
```

3. Apply the configuration:
```bash
terraform get
terraform apply
```

4. To destroy the infrastructure:
```bash
terraform destroy
```

## Security Features

- Private subnets for ECS tasks
- Security groups restricting access
- IAM roles with least privilege
- Health checks for container monitoring

## Infrastructure Tags

All resources are tagged with:
- Environment: dev
- ManagedBy: Terraform
- CreatedBy: lroquec
- Owner: DevOps Team

## Monitoring

- CloudWatch logs enabled for all ECS services
- Retention period: 7 days
- Health check endpoints configured for each service

## Important Notes

- The ALB is configured to handle HTTP traffic on port 80
- Container health checks are performed using curl commands
- Route53 records are automatically created for each service
- Private subnets use NAT Gateway for outbound internet access
