resource "aws_iam_role" "ec2_s3_role" {
    name = "ec2_s3_role"

    assume_role_policy = jsonencode({
        "Version": "2012-10-17",
        "Statement": [{
            "Action": "sts:AssumeRole",
            "Effect": "Allow",
            "Principal": {
                "Service": "ec2.amazonaws.com"
      }
    }]
  })
}

resource "aws_iam_policy" "s3_policy" {
    name = "s3_access_policy"
    description = "Allow EC2 to access private S3 bucket"

    policy = jsonencode({
        "Version": "2012-10-17",
        "Statement": [{
            "Action": [
                "s3:GetObject"
            ],
            "Effect": "Allow"
            "Resource": "arn:aws:s3:::bucket-with-ssh-pem-private/*"
        }]
    })
}

resource "aws_iam_role_policy_attachment" "ec2_role_attach" {
    role = aws_iam_role.ec2_s3_role.name
    policy_arn = aws_iam_policy.s3_policy.arn
}

resource "aws_iam_instance_profile" "ec2_instance_profile" {
    name = "ec2_instance_profile"
    role = aws_iam_role.ec2_s3_role.name
}
#This section commented on establishing a stable, accidently undestroyable connection with Github Actions.

# resource "aws_iam_openid_connect_provider" "GitHub" {
#   url             = "https://token.actions.githubusercontent.com"
#   client_id_list  = ["sts.amazonaws.com"]
#   thumbprint_list = ["6938fd4d98bab03faadb97b34396831e3780aea1", "1c58a3a8518e8759bf075b76b750d4f2df264fcd"]
# }

# resource "aws_iam_role" "GitHub_Actions" {
#   name               = "GitHub_Actions"
#   assume_role_policy = <<EOF
# {
#     "Version": "2012-10-17",
#     "Statement": [
#         {
#             "Effect": "Allow",
#             "Principal": {
#                 "Federated": "arn:aws:iam::207567795251:oidc-provider/token.actions.githubusercontent.com"
#             },
#             "Action": "sts:AssumeRoleWithWebIdentity",
#             "Condition": {
#                 "StringEquals": {
#                     "token.actions.githubusercontent.com:aud": "sts.amazonaws.com"
#                 },
#                 "StringLike": {
#                     "token.actions.githubusercontent.com:sub": "repo:VasylKhytrych/DevOps_course_Vasylkh_2024:*"
#                 }
#             }
#         }
#     ]
# }  
# EOF
# }

# locals {
#   policies = [
#     "arn:aws:iam::aws:policy/AmazonEC2FullAccess",
#     "arn:aws:iam::aws:policy/AmazonRoute53FullAccess",
#     "arn:aws:iam::aws:policy/AmazonS3FullAccess",
#     "arn:aws:iam::aws:policy/IAMFullAccess",
#     "arn:aws:iam::aws:policy/AmazonVPCFullAccess",
#     "arn:aws:iam::aws:policy/AmazonSQSFullAccess",
#     "arn:aws:iam::aws:policy/AmazonEventBridgeFullAccess",
#     "arn:aws:iam::207567795251:policy/DynamoDB_TFLocks"
#   ]
# }

# resource "aws_iam_role_policy_attachment" "github_actions_policies" {
#   for_each   = toset(local.policies)
#   role       = aws_iam_role.GitHub_Actions.name
#   policy_arn = each.key
# }