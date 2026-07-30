## Deployment Status

This module has been validated with `terraform plan` for both the `dev`
and `prod` environment configurations (see root `main.tf`), confirming
correct variable resolution and distinct per-environment resource
configuration (instance type, tags, subnet placement). `terraform apply`
was intentionally not run to avoid provisioning billable AWS resources
for this lab exercise.

## Versioning

This module is tagged using [semantic versioning](https://semver.org/).
The current stable release is `v1.0.0`. To consume this module from an
external project, pin to the tag rather than `main`:

```hcl
source = "github.com/lojt-cloud/ce-lab-terraform-module//modules/web-server?ref=v1.0.0"
```