resource "aws_iam_user" "bharatone" {
  name = var.aws_iam_user_name
  tags = var.aws_iam_tags
}

resource "aws_iam_policy" "s3policy" {
  name        = var.aws_iam_user_policy_name
  description = "A bharat policy"
  policy      = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect   = "Allow",
        Action   = "s3:*",
        Resource = "*"
      }
    ]
  })
}

resource "aws_iam_user_policy_attachment" "bharatone-attach" {
  user       = aws_iam_user.bharatone.name
  policy_arn = aws_iam_policy.s3policy.arn
}
