variable "default_region" {
  description = "Default AWS region"
  type        = string
  default     = "eu-central-1"
}

variable "default_keypair" {
  description = "Default SSH keypair"
  type        = map(string)
  default = {
    name = "default_linux_keypair"
    id   = "key-0e21b828e27600ad0"
  }
}

variable "creator_tag" {
  description = "Common creator tag"
  type        = map(string)
  default = {
    "Creator" = "Terraform"
  }
}