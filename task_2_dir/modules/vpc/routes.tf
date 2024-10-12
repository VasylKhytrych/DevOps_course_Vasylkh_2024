# Public Route Table
resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.main_vpc.id
  tags = {
    Name    = "public-route-table"
    Creator = "Terraform"
  }
}

# Associate public subnets with the public route table
resource "aws_route_table_association" "public_table_association" {
  count          = length(var.public_subnets_cidr)
  subnet_id      = aws_subnet.public_subnets[count.index].id
  route_table_id = aws_route_table.public_route_table.id
}

# Internet access for public subnets
resource "aws_route" "public_internet_access" {
  route_table_id         = aws_route_table.public_route_table.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.igw.id
}

# Private Route Table
resource "aws_route_table" "private_route_table" {
  vpc_id = aws_vpc.main_vpc.id

  # route = [
  #   {
  #   cidr_block = "0.0.0.0/0"
  #   gateway_id = var.nat_gw_id
  #   }
  # ]

  tags = {
    Name    = "private-route-table"
    Creator = "Terraform"
  }
}

resource "aws_route" "nat_route" {
  nat_gateway_id         = var.nat_gw_id
  route_table_id         = aws_route_table.private_route_table.id
  destination_cidr_block = "0.0.0.0/0"

}

# Associate private subnets with the private route table
resource "aws_route_table_association" "private_table_association" {
  count          = length(var.private_subnets_cidr)
  subnet_id      = aws_subnet.private_subnets[count.index].id
  route_table_id = aws_route_table.private_route_table.id
}