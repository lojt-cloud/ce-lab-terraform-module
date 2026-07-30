# main.tf (root)

terraform {
  required_version = ">= 1.6.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

module "web_server_dev" {
  source = "./modules/web-server"

  project_name  = var.project_name
  environment   = "dev"
  ami_id        = var.dev_ami_id
  instance_type = "t3.micro"
  subnet_id     = var.dev_subnet_id

  tags = {
    Owner = "DevTeam"
  }
}

module "web_server_prod" {
  source = "./modules/web-server"

  project_name  = var.project_name
  environment   = "prod"
  ami_id        = var.prod_ami_id
  instance_type = "t3.large"
  subnet_id     = var.prod_subnet_id

  tags = {
    Owner      = "PlatformTeam"
    Compliance = "SOC2"
  }
}