variable "instance_type" {
  description = "Type of instance to launch"
  default     = "t2.micro"
}

variable "region" {
  description = "Default region in AWS"
  default     = "eu-central-1"
}