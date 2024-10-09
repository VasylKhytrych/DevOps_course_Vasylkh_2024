resource "aws_eip" "nat_eip" {
  domain = "vpc"

  tags = {
    Creator = "Terraform"
    Name = "NAT EIP"
  }
}

resource "aws_eip" "bastion_ip" {
    domain = "vpc"
    
    tags = {
        Creator = "Terrafrom"
        Name = "Jump host EIP"
    }
  
}

resource "aws_eip_association" "bastion_ip_attach" {
    instance_id = aws_instance.bastion.id
    allocation_id = aws_eip.bastion_ip.id
}