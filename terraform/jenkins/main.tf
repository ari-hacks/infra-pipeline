provider "aws" {
    region = "us-east-1"
}

//store state in s3 bucket
terraform {
  backend "s3" {
    bucket = "bucket-name"
    key    = "terraform.tfstate"
    region = "us-east-2"
  }
}
resource "aws_instance" "jenkins_instance" {
    ami = "ami-04b9e92b5572fa0d1"
    instance_type = "t2.micro"
    key_name = "infra-key"

    tags = {
        Name = "${var.name}"
    }
}