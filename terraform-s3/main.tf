resource "aws_s3_bucket" "uat_bucket" {
  bucket = var.bucket-name

  tags = {
    Name        = var.bucket-name
    ManagedBy   = "terraform"
    Environment = var.env
  }
}

resource "aws_s3_bucket_public_access_block" "block_public" {
  bucket = aws_s3_bucket.uat_bucket.id

  block_public_acls       = var.acl
  block_public_policy     = var.policy
  ignore_public_acls      = var.ignore
  restrict_public_buckets = var.resrict
}

resource "aws_s3_bucket_website_configuration" "website" {
  bucket = aws_s3_bucket.uat_bucket.id

  index_document {
    suffix = "index.html"
  }
}

resource "aws_s3_bucket_policy" "bucket_policy" {
  bucket = aws_s3_bucket.uat_bucket.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid       = "PublicReadGetObject"
        Effect    = "Allow"
        Principal = "*"
        Action    = "s3:GetObject"
        Resource  = "${aws_s3_bucket.uat_bucket.arn}/*"
      }
    ]
  })
}