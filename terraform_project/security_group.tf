resource "aws_security_group" "first_basic" {
  name = "first_basic"
}

resource "aws_security_group_rule" "inbound_http" {
  from_port         = 80
  protocol          = "TCP"
  security_group_id = aws_security_group.first_basic.id
  to_port           = 80
  type              = "ingress"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "engress" {
  from_port         = 0
  protocol          = "all"
  security_group_id = aws_security_group.first_basic.id
  to_port           = 0
  type              = "egress"
  cidr_blocks       = ["0.0.0.0/0"]
}