provider "aws" {
    region = "us-east-2"
}

resource "aws_instance" "jenkins_instance" {
    ami = "ami-0a63f96e85105c6d3"
    instance_type = "t2.micro"
    key_name = "infra-key"

    tags = {
        Name = "${var.name}"
    }
}