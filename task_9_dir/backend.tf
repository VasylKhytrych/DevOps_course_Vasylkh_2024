terraform {
  backend "s3" {
    bucket         = "devops-course-vasylk-2024-tfstates"
    key            = "terraform.tfstate"
    region         = "eu-central-1"
    dynamodb_table = "TF_Lock_ID"
    encrypt        = true
  }
}