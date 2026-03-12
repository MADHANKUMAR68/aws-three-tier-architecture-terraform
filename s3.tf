resource "aws_s3_bucket" "app_bucket" {
  bucket = "three-tier-app-bucket-123456789"

  tags = {
    Name        = "three-tier-app-bucket"
    Environment = "dev"
  }
}

resource "aws_s3_bucket_versioning" "app_bucket_versioning" {
  bucket = aws_s3_bucket.app_bucket.id

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_public_access_block" "app_bucket_pab" {
  bucket = aws_s3_bucket.app_bucket.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}
