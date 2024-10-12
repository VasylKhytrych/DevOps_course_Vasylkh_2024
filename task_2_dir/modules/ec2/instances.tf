resource "aws_instance" "bastion" {
  ami           = var.ami_id_default
  instance_type = var.instance_type_default
  subnet_id     = var.public_subnets_id[0]
  key_name      = var.default_keypair["name"]
  #  security_groups      = [aws_security_group.bastion_sg.name]
  iam_instance_profile   = var.iam_instance_profile_name
  vpc_security_group_ids = [aws_security_group.bastion_sg.id]

  user_data = <<-EOF
              #!/bin/bash
              sudo yum install -y aws-cli
              aws s3 cp s3://bucket-with-ssh-pem-private/default_linux_keypair.pem /home/ec2-user/.ssh/default_linux_keypair.pem
              chmod 400 /home/ec2-user/.ssh/default_linux_keypair.pem
              EOF

  tags = {
    Name    = "Jump host"
    Creator = "Terraform"
  }
}

resource "aws_instance" "public_instance" {
  ami                         = var.ami_id_default
  instance_type               = var.instance_type_default
  subnet_id                   = var.public_subnets_id[1]
  associate_public_ip_address = true
  key_name                    = var.default_keypair["name"]
  #  security_groups             = [aws_security_group.public_access_sg.name]
  iam_instance_profile   = var.iam_instance_profile_name
  vpc_security_group_ids = [aws_security_group.public_access_sg.id]

  user_data = <<-EOF
              #!/bin/bash
              sudo yum install -y aws-cli
              aws s3 cp s3://bucket-with-ssh-pem-private/default_linux_keypair.pem /home/ec2-user/.ssh/default_linux_keypair.pem
              chmod 400 /home/ec2-user/.ssh/default_linux_keypair.pem
              EOF

  tags = {
    Name    = "Pub_instance_2"
    Creator = "Terraform"
  }
}

resource "aws_instance" "private_instance_1" {
  ami           = var.ami_id_default
  instance_type = var.instance_type_default
  subnet_id     = var.private_subnets_id[0]
  key_name      = var.default_keypair["name"]
  #  security_groups      = [aws_security_group.private_sg.name]
  iam_instance_profile   = var.iam_instance_profile_name
  vpc_security_group_ids = [aws_security_group.private_sg.id]

  user_data = <<-EOF
              #!/bin/bash
              sudo yum install -y aws-cli
              aws s3 cp s3://bucket-with-ssh-pem-private/default_linux_keypair.pem /home/ec2-user/.ssh/default_linux_keypair.pem
              chmod 400 /home/ec2-user/.ssh/default_linux_keypair.pem
              EOF

  tags = {
    Name    = "Priv_instance_1"
    Creator = "Terraform"
  }
}

resource "aws_instance" "private_instance_2" {
  ami           = var.ami_id_default
  instance_type = var.instance_type_default
  subnet_id     = var.private_subnets_id[1]
  key_name      = var.default_keypair["name"]
  #  security_groups      = [aws_security_group.private_sg.name]
  iam_instance_profile   = var.iam_instance_profile_name
  vpc_security_group_ids = [aws_security_group.private_sg.id]

  user_data = <<-EOF
              #!/bin/bash
              sudo yum install -y aws-cli
              aws s3 cp s3://bucket-with-ssh-pem-private/default_linux_keypair.pem /home/ec2-user/.ssh/default_linux_keypair.pem
              chmod 400 /home/ec2-user/.ssh/default_linux_keypair.pem
              EOF

  tags = {
    Name    = "Priv_instance_2"
    Creator = "Terraform"
  }
}