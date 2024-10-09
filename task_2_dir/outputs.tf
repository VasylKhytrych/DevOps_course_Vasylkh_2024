# Call the modules
module "vpc" {
  source    = "./modules/vpc"
  nat_gw_id = module.ec2.nat_gw_id
}

module "ec2" {
  source              = "./modules/ec2"
  vpc_id              = module.vpc.vpc_id
  public_subnets_cidr = ["10.0.10.0/24", "10.0.11.0/24"]
  public_subnets_id   = module.vpc.public_subnets
  private_subnets_id  = module.vpc.private_subnets
  default_keypair     = var.default_keypair
}

module "iam" {
  source = "./modules/iam"
}

module "s3" {
  source = "./modules/s3"
}

output "vpc_id" {
  description = "The ID of the VPC"
  value       = module.vpc.vpc_id
}

output "public_subnets" {
  description = "List of public subnet IDs"
  value       = module.vpc.public_subnets[*]
}

output "private_subnets" {
  description = "List of private subnet IDs"
  value       = module.vpc.private_subnets[*]
}

output "instance_ips" {
  description = "All ips of created instances"
  value       = module.ec2.instance_ips
}