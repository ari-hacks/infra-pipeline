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
    provisioner "remote-exec" {
    # Install Python for Ansible
    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = file(var.ssh_key_private)
      host        = aws_instance.jenkins_instance.public_ip
      timeout = "500s"
    }
      working_dir = "../../ansible"
      inline = ["sudo ansible-playbook jenkins.yaml"]
  }

  # provisioner "local-exec" {
  #   working_dir = "../../ansible"
  #   # command = "sleep 120; ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -u ubuntu --private-key ${var.ssh_key_private} jenkins.yaml"
  #   command = "ansible-playbook -u ubuntu -i ‘${aws_instance.jenkins_instance.public_dns},’ jenkins.yaml"
  # }
}