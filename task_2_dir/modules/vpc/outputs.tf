output "vpc_id" {
  description = "VPC ID"
  value       = aws_vpc.main_vpc.id
}

output "public_subnets" {
  description = "IDs of pub subnets"
  value       = aws_subnet.public_subnets[*].id
}

output "private_subnets" {
  description = "IDs of pub subnets"
  value       = aws_subnet.private_subnets[*].id
}