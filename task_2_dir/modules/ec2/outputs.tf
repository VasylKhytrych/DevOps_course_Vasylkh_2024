output "nat_gw_id" {
  value = aws_nat_gateway.nat_gw.id
}


output "instance_ips" {
    value = {
        bastion_pub_ip = aws_instance.bastion.public_ip
        bastion_priv_ip = aws_instance.bastion.private_ip

        public_host_public_ip = aws_instance.public_instance.public_ip
        public_host_priv_ip = aws_instance.public_instance.private_ip

        priv_host_1_ip = aws_instance.private_instance_1.private_ip
        priv_host_2_ip = aws_instance.private_instance_2.private_ip
    }
}

output "public_host_ip" {
    value = aws_instance.public_instance.public_ip
}

output "public_host_priv_ip" {
    value = aws_instance.public_instance.public_ip
}

