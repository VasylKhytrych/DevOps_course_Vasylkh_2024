output "nat_gw_id" {
  value = aws_nat_gateway.nat_gw.id
}


output "instance_ips" {
  value = {
    bastion_pub_ip  = aws_instance.bastion.public_ip
    bastion_priv_ip = aws_instance.bastion.private_ip

    k3s_master_ip = aws_instance.k3s-master.private_ip
    k3s_worker_ip = aws_instance.k3s-worker[*].private_ip
  }
}

