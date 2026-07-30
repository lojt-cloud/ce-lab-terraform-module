# modules/web-server/main.tf

resource "aws_instance" "this" {
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = var.subnet_id
  key_name      = var.key_name

  tags = merge(
    var.tags,
    {
      Name        = "${var.project_name}-${var.environment}-web-server"
      Environment = var.environment
      ManagedBy   = "Terraform"
    }
  )
}