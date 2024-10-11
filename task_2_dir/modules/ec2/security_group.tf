resource "aws_security_group" "public_access_sg" {
  description = "Security group for public subnets"
  name        = "public_access_sg"
  vpc_id      = var.vpc_main.id

  ingress {
    description = "Allow inbound HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow inbound HTTPS"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow inbound SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow inbound ICMP traffic (ping)"
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "all"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name    = "Public SG"
    Creator = "Terraform"
  }
}

resource "aws_security_group" "private_sg" {
  name        = "private_sg"
  description = "Security group for private subnets"
  vpc_id      = var.vpc_main.id

  ingress {
    description     = "Allow inbound traffic from public subnets"
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    security_groups = [
      aws_security_group.public_access_sg.id,
      aws_security_group.bastion_sg.id]
  }

  ingress {
    description = "Allow inbound ICMP from VPC"
    from_port   = 0
    to_port     = 0
    protocol    = "icmp"
    cidr_blocks = [var.vpc_main.cidr_block]    
  }

  ingress {
    description = "Allow SSH from public subnet"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = var.public_subnets_cidr
  }

  egress {
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name    = "Private Security Group"
    Creator = "Terraform"
  }
}

resource "aws_security_group" "bastion_sg" {
  description = "Security group for jump host"
  name        = "bastion_sg"
  vpc_id      = var.vpc_main.id

  ingress {
    description = "SSH from provider ip"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["185.191.149.112/32"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "all"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name    = "Bastion SG"
    Creator = "Terraform"
  }  
}

# resource "aws_security_group_rule" "inbound_http" {
#   from_port         = 80
#   protocol          = "TCP"
#   security_group_id = aws_security_group.public_access_sg.id
#   to_port           = 80
#   type              = "ingress"
#   cidr_blocks       = ["0.0.0.0/0"]
# }

# resource "aws_security_group_rule" "engress" {
#   from_port         = 0
#   protocol          = "all"
#   security_group_id = aws_security_group.public_access_sg.id
#   to_port           = 0
#   type              = "egress"
#   cidr_blocks       = ["0.0.0.0/0"]
# }