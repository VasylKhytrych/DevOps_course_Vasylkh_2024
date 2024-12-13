# resource "aws_ebs_volume" "volume_50" {
#   availability_zone = aws_instance.bastion.availability_zone
#   size              = 50
#   type              = "gp3"

#   tags = {
#     Creator = "Terraform"
#     Name    = "BastionEBS"
#   }
# }

# resource "aws_volume_attachment" "bastion_volume_attachment" {
#   device_name = "/dev/sdf"
#   volume_id   = aws_ebs_volume.volume_50.id
#   instance_id = aws_instance.bastion.id
# }
