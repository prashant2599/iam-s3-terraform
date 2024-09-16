provider "aws" {
  region = "ap-south-1"
}

module "iam" {
  source = "./modules/iam"
  aws_iam_tags = var.aws_iam_tags
  aws_iam_user_name = var.aws_iam_user_name
  aws_iam_user_policy_name = var.aws_iam_user_policy_name
  
  
}

module "s3" {
  source = "./modules/s3"
  aws_s3_bucket_bucket_name = var.aws_s3_bucket_bucket_name
  aws_s3_bucket_tag = var.aws_s3_bucket_tag

}