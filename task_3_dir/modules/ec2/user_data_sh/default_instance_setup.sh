#!/bin/bash
sudo yum install -y aws-cli

# Enable SSH Agent Forwarding
echo 'AllowAgentForwarding yes' | sudo tee -a /etc/ssh/sshd_config

# Restart SSHD to apply the changes
sudo systemctl restart sshd

PRIVATE_IP=$(hostname -I | awk '{print $1}')
INSTANCE_INFO=$(aws ec2 describe-instances --filters "Name=private-ip-address,Values=$PRIVATE_IP" --query "Reservations[*].Instances[*].[InstanceId, Tags[?Key=='Name'].Value]" --output text)
INSTANCE_NAME=$(echo $INSTANCE_INFO | awk '{print $2}')
sudo hostnamectl set-hostname "$INSTANCE_NAME"

# BASTION_IP=$(aws ec2 describe-instances --filters "Name=private-ip-address,Values=$PRIVATE_IP" --query "Reservations[*].Instances[*].PublicIpAddress" --output text)
# ssh -f -N -A -L 6443:${MASTER_IP}:6443 login@${BASTION_IP}