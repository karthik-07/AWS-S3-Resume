terraform {
  backend "s3" {
    bucket = "terraform-state-bucket-karthik"
    key    = "state"
    region = "us-east-1"
  }
}

