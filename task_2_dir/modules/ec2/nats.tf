resource "aws_nat_gateway" "nat_gw" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = var.public_subnets_id[0]

  tags = {
    Creator = "Terraform"
    Name    = "NAT_GW"
  }
}