# variables.tf (root)

variable "aws_region" {
  description = "AWS region to deploy into"
  type        = string
  default     = "us-east-1"
}

variable "project_name" {
  description = "Project name for resource naming"
  type        = string
  default     = "myproject"
}

variable "dev_ami_id" {
  description = "AMI ID for the dev web server"
  type        = string
}

variable "dev_subnet_id" {
  description = "Subnet ID for the dev web server"
  type        = string
}

variable "prod_ami_id" {
  description = "AMI ID for the prod web server"
  type        = string
}

variable "prod_subnet_id" {
  description = "Subnet ID for the prod web server"
  type        = string
}