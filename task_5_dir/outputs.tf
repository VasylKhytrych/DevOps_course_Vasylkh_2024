# Call the modules
module "vpc" {
  source    = "./modules/vpc"
  nat_gw_id = module.ec2.nat_gw_id
}

module "ec2" {
  source                    = "./modules/ec2"
  vpc_main                  = module.vpc.vpc_main
  public_subnets_cidr       = ["10.0.10.0/24", "10.0.11.0/24"]
  public_subnets_id         = module.vpc.public_subnets
  private_subnets_id        = module.vpc.private_subnets
  default_keypair           = var.default_keypair
  iam_instance_profile_name = module.iam.iam_instance_profile
}

module "iam" {
  source = "./modules/iam"
}

module "s3" {
  source = "./modules/s3"
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