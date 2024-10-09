resource "aws_instance" "bastion" {
  ami           = var.ami_id_default
  instance_type = var.instance_type_default
  subnet_id     = var.public_subnets_id[0]
  key_name = var.default_keypair["name"]
  security_groups = [aws_security_group.bastion_sg.id]

  tags = {
    Name    = "Jump host"
    Creator = "Terraform"
  }
}

resource "aws_instance" "public_instance" {
  ami           = var.ami_id_default
  instance_type = var.instance_type_default
  subnet_id     = var.public_subnets_id[1]
  associate_public_ip_address = true
  key_name = var.default_keypair["name"]
  security_groups = [aws_security_group.public_access_sg.id]
  
  tags = {
    Name    = "Pub_sub_instance_2"
    Creator = "Terraform"
  }
}

resource "aws_instance" "private_instance_1" {
  ami           = var.ami_id_default
  instance_type = var.instance_type_default
  subnet_id     = var.private_subnets_id[0]
  key_name = var.default_keypair["name"]
  security_groups = [aws_security_group.private_sg.id]
  
  tags = {
    Name    = "Priv_sub_instance_1"
    Creator = "Terraform"
  }
}

resource "aws_instance" "private_instance_2" {
  ami           = var.ami_id_default
  instance_type = var.instance_type_default
  subnet_id     = var.private_subnets_id[1]
  key_name = var.default_keypair["name"]
  security_groups = [aws_security_group.private_sg.id]
  
  tags = {
    Name    = "Priv_sub_instance_2"
    Creator = "Terraform"
  }
}