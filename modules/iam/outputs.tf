output "aws_iam_user_information" {
  description = "IAM user policy ARN"
  value       = aws_iam_policy.s3policy.arn
}
