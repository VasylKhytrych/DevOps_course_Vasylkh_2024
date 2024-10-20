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

# variable "ud_default_istance_setup" {
#   type        = string
#   description = "Script to set up instance with SSH forwarding"
#   default     = <<-EOF
#               #!/bin/bash
#               sudo yum install -y aws-cli

#               # Enable SSH Agent Forwarding
#               echo 'AllowAgentForwarding yes' | sudo tee -a /etc/ssh/sshd_config

#               # Restart SSHD to apply the changes
#               sudo systemctl restart sshd

#               PRIVATE_IP=$(hostname -I | awk '{print $1}')
#               INSTANCE_INFO=$(aws ec2 describe-instances --filters "Name=private-ip-address,Values=$PRIVATE_IP" --query "Reservations[*].Instances[*].[InstanceId, Tags[?Key=='Name'].Value]" --output text)
#               INSTANCE_NAME=$(echo $INSTANCE_INFO | awk '{print $2}')
#               sudo hostnamectl set-hostname "$INSTANCE_NAME"

#               EOF
# }

# variable "ud_k3s_master" {
#   type        = string
#   description = "Script to set up k3s for master"
#   default     = <<-EOF
#               #!/bin/bash
#               curl -sfL https://get.k3s.io | sh - #install k3s
#               echo "Master node is set up"
#               EOF
# }

# variable "ud_k3s_worker" {
#   type        = string
#   description = "Script to set up k3s for master"
#   default     = <<-EOF
#               #!/bin/bash
#               yum install -y jq
#               MASTER_IP="%MASTER_IP%"
#               TOKEN="$(curl -s http://$MASTER_IP:6443/v1/nodes | jq -r '.items[0].metadata.annotations."k3s.io/token"')"
#               curl -sfL https://get.k3s.io | K3S_URL=https://$MASTER_IP:6443 K3S_TOKEN=$TOKEN sh -
#               EOF
# }