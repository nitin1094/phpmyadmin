/*==== VPC's Default Security Group ======*/
resource "aws_security_group" "default" {
  name        = "${var.environment}-default-sg"
  description = "Default security group to allow inbound/outbound from the VPC"
  vpc_id      = var.vpc_id
  depends_on  = [var.vpc]
  ingress {
    from_port = "0"
    to_port   = "0"
    protocol  = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    self      = true
  }
  
  egress {
    from_port = "0"
    to_port   = "0"
    protocol  = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    self      = "true"
  }
  tags = {
    Environment = "${var.environment}"
  }
}
