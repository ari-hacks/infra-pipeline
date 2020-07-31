//store state in s3 bucket
terraform {
  backend "s3" {
    bucket = "bucket-name"
    key    = "terraform.tfstate"
    region = "us-east-2"
  }
}
