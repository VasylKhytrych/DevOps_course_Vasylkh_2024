resource "aws_instance" "bastion" {
  ami                    = var.ami_id_default
  instance_type          = var.instance_type_default
  subnet_id              = var.public_subnets_id[0]
  key_name               = var.default_keypair["name"]
  iam_instance_profile   = var.iam_instance_profile_name
  vpc_security_group_ids = [aws_security_group.bastion_sg.id]

  user_data = file("${path.module}/user_data_sh/default_instance_setup.sh")

  tags = {
    Name    = "Bastion"
    Creator = "Terraform"
  }
}

#setup for master k3s node
resource "aws_instance" "k3s-master" {
  ami                    = var.ami_id_default
  instance_type          = var.instance_type_default
  subnet_id              = var.private_subnets_id[0]
  key_name               = var.default_keypair["name"]
  iam_instance_profile   = var.iam_instance_profile_name
  vpc_security_group_ids = [aws_security_group.private_sg.id, aws_security_group.k3s_sg.id]

  user_data_replace_on_change = true
  user_data                   = "${file("${path.module}/user_data_sh/default_instance_setup.sh")}\n${file("${path.module}/user_data_sh/k3s_master.sh")}"

  tags = {
    Name    = "k3s-master"
    Creator = "Terraform"
  }
}

#setup for worker k3s node
resource "aws_instance" "k3s-worker" {
  count                  = 2
  ami                    = var.ami_id_default
  instance_type          = var.instance_type_default
  subnet_id              = var.private_subnets_id[(count.index % 2) + 1] #worker nodes will be created in 2-nd and 3-th subnets
  key_name               = var.default_keypair["name"]
  iam_instance_profile   = var.iam_instance_profile_name
  vpc_security_group_ids = [aws_security_group.private_sg.id, aws_security_group.k3s_sg.id]

  user_data_replace_on_change = true
  user_data = "${file("${path.module}/user_data_sh/default_instance_setup.sh")}\n${templatefile("${path.module}/user_data_sh/k3s_worker.sh", {
    MASTER_IP = aws_instance.k3s-master.private_ip
  })}"

  depends_on = [aws_instance.k3s-master] # Wait for the master node to be created to get and pass master node ip

  tags = {
    Name    = "k3s-worker-${count.index + 1}"
    Creator = "Terraform"
  }
}