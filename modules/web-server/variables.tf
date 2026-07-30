# modules/web-server/variables.tf

variable "project_name" {
  description = "Project name for resource naming"
  type        = string
}

variable "environment" {
  description = "Environment name (dev, staging, prod)"
  type        = string

  validation {
    condition     = contains(["dev", "staging", "prod"], var.environment)
    error_message = "Environment must be dev, staging, or prod."
  }
}

variable "ami_id" {
  description = "AMI ID to launch the instance from"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.micro"
}

variable "subnet_id" {
  description = "Subnet ID to launch the instance into"
  type        = string
}

variable "key_name" {
  description = "Name of an existing EC2 key pair for SSH access (optional)"
  type        = string
  default     = null
}

variable "tags" {
  description = "Additional tags for the instance"
  type        = map(string)
  default     = {}
}