terraform {
  backend "s3" {
    bucket = "lroquec-tf"
    key    = "dev/ecs/terraform.tfstate"
    region = "us-east-1"
    # For DynamoDB locking in production environments
    # dynamodb_table = "terraform-locks"
  }
}