variable "instance_type" {
  description = "Type of instance to launch"
  default     = "t2.micro"
}

variable "region" {
  description = "Default region in AWS"
  default     = "eu-central-1"
}

variable "aws_s3_bucket_name" {
  description = "AWS S3 Bucket name"
  type        = string
  default     = "bucket-as-task-for-devops-course-vasylk"
}