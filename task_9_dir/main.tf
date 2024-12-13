terraform {
  required_version = "1.9.6"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.69.0"
    }
  }
}

provider "aws" {
  #profile = "devops_lab_1"
  region = var.default_region
}