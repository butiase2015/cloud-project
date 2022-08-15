resource "aws_security_group" "test" {
  name = var.security_group_name

  ingress {
    from_port   = var.src_port
    to_port     = var.dst_port
    protocol    = var.protocol
    cidr_blocks = var.ingress_cidr_blocks
  }
}