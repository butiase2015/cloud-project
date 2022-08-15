data "aws_availability_zones" "all" {}

resource "aws_elb" "example" {
  name               = var.elb_name
  security_groups    = var.security_groups
  availability_zones = data.aws_availability_zones.all.names

  health_check {
    target              = "HTTP:${var.server_port}/"
    interval            = var.health_check_interval
    timeout             = var.health_check_timeout
    healthy_threshold   = var.healthy_threshold
    unhealthy_threshold = var.unhealthy_threshold
  }


  listener {
    lb_port           = var.elb_port
    lb_protocol       = var.lb_protocol
    instance_port     = var.server_port
    instance_protocol = var.instance_protocol
  }
}