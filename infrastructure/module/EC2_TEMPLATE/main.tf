resource "aws_launch_configuration" "test" {
  image_id        = var.image_id
  instance_type   = var.instance_type
  security_groups = var.security_groups

  user_data = var.user_data

  lifecycle {
    create_before_destroy = true
  }
}
