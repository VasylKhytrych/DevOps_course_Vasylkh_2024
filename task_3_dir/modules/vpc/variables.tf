variable "vpc_cidr" {
  description = "Default CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnets_cidr" {
  description = "CIDR blocks for public subnets"
  type        = list(string)
  default     = ["10.0.10.0/24", "10.0.11.0/24"]
}

variable "private_subnet_count" {
  description = "Number of private subnets"
  type        = number
  default     = 3
}

# Calculate private subnet CIDRs dynamically
locals {
  private_subnets_cidr = [for i in range(var.private_subnet_count) : cidrsubnet(var.vpc_cidr, 8, i + 100)]
}

output "private_subnets_cidr" {
  value = local.private_subnets_cidr
}

# variable "private_subnets_cidr" {
#   description = "CIDR blocks for private subnets"
#   type        = list(string)
#   default     = output.private_subnets_cidr
# }

variable "availability_zones" {
  description = "List of availability zones to use for subnets"
  type        = list(string)
  default     = ["eu-central-1a", "eu-central-1b"]
}

variable "nat_gw_id" {
  description = "NAT GW for rt"
  #  type = list(object ({gateway_id=string}))
}