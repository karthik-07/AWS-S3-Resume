terraform {
  backend "s3" {
    bucket = "terraform-state-bucket-karthik"
    key    = "terraform-state/state"
    region = "us-east-1"
  }
}

