# PROVIDER
#----------------------------------------
provider "aws" {
  region = var.aws_region
}

# Terraform configuration
terraform {

  # Backend must remain commented until the S3 bucket and the DynamoDB table are created.
  # After the creation we can uncomment it, run "terraform init" and then "terraform apply"

  # backend "s3" {
  #   bucket         = "luis-cloud-app-terraform-state-backend"
  #   key            = "database/mysql/terraform.tfstate"
  #   region         = "eu-west-2"
  #   dynamodb_table = "dynamodb-terraform-state-lock-table"
  #   encrypt        = true
  # }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.0"
    }

    random = {
      source  = "hashicorp/random"
      version = ">= 3.0"
    }
  }
}


# DABATASE CONFIGURATION
resource "aws_db_instance" "default_db" {
  identifier_prefix   = "${var.project_name}-default-db"
  db_name             = "luis_cloud_app_database"
  engine              = "mysql"
  allocated_storage   = 10
  instance_class      = "db.t2.micro"
  skip_final_snapshot = true

  username = var.db_username
  password = var.db_password

  tags = {
    Name = "${var.project_name}-default-db"
  }
}
