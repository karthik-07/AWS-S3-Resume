resource "aws_s3_bucket" "static-file-store-karthik" {
    bucket = var.static_bucket_name  
}

resource "aws_s3_bucket_versioning" "bucket_static_file_versioning" {
    bucket = aws_s3_bucket.static-file-store-karthik.id
    versioning_configuration {
      status = "Enabled"
    }  
}


resource "aws_s3_bucket_website_configuration" "static-website-config" {
  bucket = aws_s3_bucket.static-file-store-karthik.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key  = "error.html"
  }
}

resource "aws_s3_bucket_public_access_block" "s3-bucket-access-block" {
  bucket = aws_s3_bucket.static-file-store-karthik.id

  block_public_acls = false
  block_public_policy = false
  ignore_public_acls = false
  restrict_public_buckets = false
}