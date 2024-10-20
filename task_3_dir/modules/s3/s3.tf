#Example that i can create buckets via Terraform)

resource "aws_s3_bucket" "bucket-as-task-for-devops-course-vasylk" {
  bucket        = var.aws_s3_bucket_name
  force_destroy = true
  tags = {
    Creator = "Terraform"
  }
}

resource "aws_s3_bucket_versioning" "bucket-as-task-for-devops-course-vasylk" {
  bucket = var.aws_s3_bucket_name
  versioning_configuration {
    status = "Enabled"
  }
}