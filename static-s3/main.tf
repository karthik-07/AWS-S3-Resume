resource "aws_s3_bucket" "static-file-store-karthik" {
    bucket = var.static_bucket_name  
}

resource "aws_s3_bucket_versioning" "bucket_static_file_versioning" {
    bucket = aws_s3_bucket.static-file-store-karthik.id
    versioning_configuration {
      status = "Enabled"
    }  
}