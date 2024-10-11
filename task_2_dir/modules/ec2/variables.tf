variable "instance_type_default" {
  description = "Default instance type for launch in scope of Free Tier"
  default     = "t2.micro"
}

variable "ami_id_default" {
  description = "Default EC2 instance AMI"
  type        = string
  default     = "ami-0592c673f0b1e7665"
}

variable "vpc_main" {
  description = "The ID of the VPC"
  #  type        = string
}

variable "public_subnets_cidr" {
  description = "CIDR blocks for public subnets"
  type        = list(string)
  default     = ["10.0.10.0/24", "10.0.11.0/24"]
}

variable "public_subnets_id" {
  description = "IDs of public subnets"
  type        = list(string)
}

variable "private_subnets_id" {
  description = "IDs of public subnets"
  type        = list(string)
}

variable "default_keypair" {
  description = "Default SSH keypair"
  type        = map(string)
}

variable "iam_instance_profile_name" {
  description = "IAM role for access to s3 with key"
  type        = string
}