data "aws_availability_zones" "all" {}


resource "aws_autoscaling_group" "example" {
  launch_configuration = var.launch_configuration
  availability_zones   = data.aws_availability_zones.all.names

  min_size = var.min_instance
  max_size = var.max_instance

  load_balancers    = var.load_balancers
  health_check_type = var.health_check_type

  tag {
    key                = var.tag_key
    value               = var.tag_value
    propagate_at_launch = var.tag_propagate_at_launch
  }
}