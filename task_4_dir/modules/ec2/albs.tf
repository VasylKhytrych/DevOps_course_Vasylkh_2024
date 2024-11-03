# resource "aws_lb" "jenkins_alb" {
#   name               = "jenkins-lb"
#   internal           = false
#   load_balancer_type = "application"
#   security_groups    = [aws_security_group.k3s_sg.id]
#   subnets            = var.public_subnets_id

#   tags = {
#     Creator = "Terraform"
#     Name    = "Jenkins_alb"
#   }
# }

# resource "aws_lb_listener" "http_listener" {
#   load_balancer_arn = aws_lb.jenkins_alb.arn
#   port              = 80
#   protocol          = "HTTP"

#   default_action {
#     type             = "forward"
#     target_group_arn = aws_lb_target_group.jenkins_tg.arn
#   }
# }

# resource "aws_lb_target_group" "jenkins_tg" {
#   name     = "jenkins-tg"
#   port     = 8080  # Match Jenkins port
#   protocol = "HTTP"
#   vpc_id   = var.vpc_main.id
# }
