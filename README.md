## Deployment Status

This module has been validated with `terraform plan` for both the `dev`
and `prod` environment configurations (see root `main.tf`), confirming
correct variable resolution and distinct per-environment resource
configuration (instance type, tags, subnet placement). `terraform apply`
was intentionally not run to avoid provisioning billable AWS resources
for this lab exercise.