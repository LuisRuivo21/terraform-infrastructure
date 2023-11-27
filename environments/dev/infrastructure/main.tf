# PROVIDER
#----------------------------------------
provider "aws" {
  region = var.aws_region

  default_tags {
    tags = {
      App         = var.project_name
      Environment = var.environment
      Terraform   = "True"
    }
  }
}


# TERRAFORM CONFIGURATION 
#----------------------------------------
terraform {
  # Backend configuration using S3 bucket and DynamoDB Table for remote state storage.

  # Backend must remain commented until the S3 bucket and the DynamoDB table are created.
  # After the creation we can uncomment it, run "terraform init" and then "terraform apply"

  # backend "s3" {
  #   bucket         = "luis-cloud-app-terraform-state-backend"
  #   key            = "modules/infrastructure/remote-backend/terraform.tfstate"
  #   region         = "eu-west-2"
  #   dynamodb_table = "dynamodb-terraform-state-lock-table"
  #   encrypt        = true
  # }

  # Required providers and their versions
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


# REUSABLE MODULES
#----------------------------------------

module "alb" {
  source         = "../../../modules/infrastructure/alb"
  ec2_sg_id      = module.sg.ec2_sg_id
  vpc_id         = module.network.vpc_id
  public_subnets = [for subnet in module.network.public_subnets : subnet.id]
}

module "asg" {
  source          = "../../../modules/infrastructure/asg"
  private_subnets = [for subnet in module.network.private_subnets : subnet.id]
  alb_tg_http_arn = module.alb.alb_tg_http_arn
  ssh_sg_id       = [module.sg.ssh_sg_id]
  alb_sg_id       = [module.sg.alb_sg_id]
  ec2_id          = module.ec2.ec2_id
}

module "ec2" {
  source         = "../../../modules/infrastructure/ec2"
  ssh_alb_sg_ids = module.sg.ssh_alb_sg_ids
}

module "network" {
  source = "../../../modules/infrastructure/network"
}

module "remote-backend" {
  source = "../../../modules/infrastructure/remote-backend"
}

module "sg" {
  source = "../../../modules/infrastructure/sg"
  vpc_id = module.network.vpc_id
}
