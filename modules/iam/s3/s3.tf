resource "aws_s3_bucket" "bharatonebucket" {
    bucket = var.aws_s3_bucket_bucket_name

    tags = {
      name = var.aws_s3_bucket_tag
    }
}

resource "aws_s3_bucket_ownership_controls" "s3bucektownership" {
    bucket = aws_s3_bucket.bharatonebucket.id
    rule {
    object_ownership = "BucketOwnerPreferred"
    }
}

resource "aws_s3_bucket_public_access_block" "s3buckepublicaccess" {
  bucket = aws_s3_bucket.bharatonebucket.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false

  depends_on = [ aws_s3_bucket.bharatonebucket, aws_s3_bucket_ownership_controls.s3bucektownership ]
}


resource "aws_s3_bucket_cors_configuration" "s3bucketcors" {
    bucket = aws_s3_bucket.bharatonebucket.id
        cors_rule {
    allowed_headers = ["*"]
    allowed_methods = ["GET", "PUT", "DELETE"]
    allowed_origins = ["*"]
    expose_headers  = ["ETag"]
    max_age_seconds = 3000
  }
  
}



