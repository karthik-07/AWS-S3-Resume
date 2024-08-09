resource "aws_s3_bucket" "bucket_state_terraform" {
    bucket = var.bucket_name

    tags = {
        Name = var.tag_name_s3
    }
}

resource "aws_s3_bucket_versioning" "bucket_terraform_versioning" {
    bucket = aws_s3_bucket.bucket_state_terraform.id
    versioning_configuration {
      status = "Enabled"
    }
}