# Web Server Terraform Module

Provisions a single EC2 instance with consistent naming and tagging across environments.

## Features

- Single-resource module: one `aws_instance` per call

- Consistent naming/tagging via `project_name` + `environment`

- Configurable instance type, AMI, subnet, and optional SSH key

- Caller-supplied tags merged with baseline tags (`Name`, `Environment`, `ManagedBy`)

## Known Limitation

This module does not create a security group. The instance uses the VPC's
default security group, which has no inbound rules.
 Meaning the instance will not be reachable (SSH, HTTP, etc.) from outside the VPC
unless a security group is attached separately. This is intentional for
this lab, which focuses on module structure rather than networking.

## Usage

\`\`\`hcl
module "web_server" {
  source = "./modules/web-server"

  project_name  = "myproject"
  environment   = "dev"
  ami_id        = "ami-0abcdef1234567890"
  instance_type = "t3.micro"
  subnet_id     = "subnet-0123456789abcdef0"

  tags = {
    Owner = "DevTeam"
  }
}
\`\`\`

## Inputs

|   Name       |       Description                     |    Type       |   Default    | Required |

| project_name | Project name for resource naming      | `string`      |     n/a      | yes |
| environment  | Environment (dev/staging/prod)        | `string`      |     n/a      | yes |
| ami_id       | AMI ID to launch the instance from    | `string`      |     n/a      | yes |
| instance_type| EC2 instance type                     | `string`      | `"t3.micro"` | no  |
| subnet_id    | Subnet ID to launch the instance into | `string`      |     n/a      | yes |
| key_name     | Existing EC2 key pair name for SSH    | `string`      |    `null`    | no  |
| tags         | Additional tags for the instance      | `map(string)` |     `{}`     | no  |

## Outputs

| Name        |            Description                 |

| instance_id | ID of the EC2 instance                 |
| public_ip   | Public IP address of the EC2 instance  |
| private_ip  | Private IP address of the EC2 instance |