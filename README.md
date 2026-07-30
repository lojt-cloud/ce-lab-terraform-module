# CE Lab M4.05 — Terraform Module

A reusable Terraform module that provisions a single EC2 web server
instance, called separately for `dev` and `prod` environments with
different configurations. Built to practice module structure, input/output
design, and multi-environment reuse (DRY infrastructure).

## Repository Structure

\`\`\`
ce-lab-terraform-module/
├── README.md               # this file
├── lab.instructions         # original lab assignment
├── main.tf                  # root config: calls the module for dev and prod
├── variables.tf              # root-level variables (region, AMI/subnet IDs)
├── terraform.tfvars          # local values, gitignored (not tracked)
├── modules/
│   └── web-server/
│       ├── main.tf           # aws_instance resource definition
│       ├── variables.tf      # module's configurable inputs
│       ├── outputs.tf        # values exposed back to the caller
│       └── README.md         # module usage documentation
└── screenshots/
    ├── terraform-plan.png
    ├── dev-instance.png
    └── prod-instance.png
\`\`\`

See [`modules/web-server/README.md`](modules/web-server/README.md) for the
module's full input/output reference and standalone usage example.

## Prerequisites

- Terraform >= 1.6.0
- AWS CLI configured with valid credentials (`aws configure`)
- An AWS account with a default VPC (or existing subnets to reference)

## Getting Started

1. Clone the repo and set your own values in a local `terraform.tfvars`
   (not committed — see `.gitignore`):

\`\`\`hcl
dev_ami_id     = "ami-xxxxxxxxxxxxxxxxx"
dev_subnet_id  = "subnet-xxxxxxxxxxxxxxxxx"
prod_ami_id    = "ami-xxxxxxxxxxxxxxxxx"
prod_subnet_id = "subnet-xxxxxxxxxxxxxxxxx"
\`\`\`

2. Initialize and validate:

\`\`\`bash
terraform init
terraform fmt -recursive
terraform validate
\`\`\`

3. Review the plan:

\`\`\`bash
terraform plan
\`\`\`

## Environments

| Environment | Instance Type | Owner Tag     | Extra Tags        |
|-------------|---------------|---------------|--------------------|
| dev         | `t3.micro`    | DevTeam       | —                  |
| prod        | `t3.large`    | PlatformTeam  | Compliance = SOC2  |

Both environments are provisioned from the same module source
(`./modules/web-server`), with only the input values differing —
demonstrating the module's reusability across environments.

## Deployment Status

This module has been validated with `terraform plan` for both the `dev`
and `prod` environment configurations (see root `main.tf`), confirming
correct variable resolution and distinct per-environment resource
configuration (instance type, tags, subnet placement). `terraform apply`
was intentionally not run to avoid provisioning billable AWS resources
for this lab exercise. See `screenshots/` for plan output evidence.

## Versioning

This module is tagged using [semantic versioning](https://semver.org/).
The current stable release is `v1.0.0`. To consume this module from an
external project, pin to the tag rather than `main`:

\`\`\`hcl
source = "github.com/lojt-cloud/ce-lab-terraform-module//modules/web-server?ref=v1.0.0"
\`\`\`