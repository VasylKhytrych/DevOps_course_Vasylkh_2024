resource "aws_network_acl" "public_nacl" {
  vpc_id     = aws_vpc.main_vpc.id
  subnet_ids = aws_subnet.public_subnets[*].id

  # Allow inbound HTTP
  ingress {
    protocol   = "tcp"
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 80
    to_port    = 80
  }

  # Allow inbound HTTPS
  ingress {
    protocol   = "tcp"
    rule_no    = 110
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 443
    to_port    = 443
  }

  # Allow inbound SSH
  ingress {
    protocol   = "tcp"
    rule_no    = 120
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 22
    to_port    = 22
  }

  # Allow inbound ephemeral ports
  ingress {
    protocol   = "tcp"
    rule_no    = 130
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 1024
    to_port    = 65535
  }

  # Allow inbound ICMP (ping) traffic
  ingress {
    protocol   = "icmp"
    rule_no    = 140
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 8
    to_port    = 0
  }

  # Allow all outbound traffic
  egress {
    protocol   = "-1"
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }

  # Allow outbound traffic to a private subnet
  egress {
    protocol   = "-1"
    rule_no    = 110
    action     = "allow"
    cidr_block = aws_vpc.main_vpc.cidr_block
    from_port  = 0
    to_port    = 0
  }

  tags = {
    Name    = "Public Network ACL"
    Creator = "Terraform"
  }
}

resource "aws_network_acl" "private_nacl" {
  vpc_id     = aws_vpc.main_vpc.id
  subnet_ids = aws_subnet.private_subnets[*].id

  # Allow inbound traffic from public subnets
  ingress {
    protocol   = "-1"
    rule_no    = 100
    action     = "allow"
    cidr_block = aws_vpc.main_vpc.cidr_block
    from_port  = 0
    to_port    = 0
  }

  ingress {
    protocol   = "icmp"
    rule_no    = 120
    action     = "allow"
    cidr_block = aws_vpc.main_vpc.cidr_block
    from_port  = 0
    to_port    = 0
  }
  # Allow inbound ephemeral ports
  ingress {
    protocol   = "tcp"
    rule_no    = 110
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 1024
    to_port    = 65535
  }

  # Allow all outbound traffic
  egress {
    protocol   = "-1"
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }

  tags = {
    Name    = "Private Network ACL"
    Creator = "Terraform"
  }
}