#Example that i can create buckets via Terraform)

resource "aws_s3_bucket" "bucket-as-task-for-devops-course-vasylk" {
  bucket        = "bucket-as-task-for-devops-course-vasylk"
  force_destroy = true
}

resource "aws_s3_bucket_versioning" "bucket-as-task-for-devops-course-vasylk" {
  bucket = "bucket-as-task-for-devops-course-vasylk"
  versioning_configuration {
    status = "Enabled"
  }
}