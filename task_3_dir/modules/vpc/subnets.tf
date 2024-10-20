# Public subnets
resource "aws_subnet" "public_subnets" {
  count                   = 2
  vpc_id                  = aws_vpc.main_vpc.id
  cidr_block              = var.public_subnets_cidr[count.index]
  availability_zone       = var.availability_zones[count.index]
  map_public_ip_on_launch = true
  tags = {
    Name    = "public-subnet-${count.index + 1}"
    Creator = "Terraform"
  }
}

# Private subnets
resource "aws_subnet" "private_subnets" {
  count             = var.private_subnet_count
  vpc_id            = aws_vpc.main_vpc.id
  cidr_block        = local.private_subnets_cidr[count.index]
  availability_zone = var.availability_zones[count.index % length(var.availability_zones)]
  tags = {
    Name    = "private-subnet-${count.index + 1}"
    Creator = "Terraform"
  }
}