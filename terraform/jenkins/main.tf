provider "aws" {
    region = "us-east-2"
}

data "template_file" "inventory" {
    template = "${file("inventory.tpl")}"

    vars = {
        host_dns = "${aws_instance.jenkins_instance.public_dns}"
        key_path = "${var.ssh_key_private}"
    }
}
resource "null_resource" "update_inventory" {

    triggers = {
        template = "${data.template_file.inventory.rendered}"
    }

    provisioner "local-exec" {
        command = "echo '${data.template_file.inventory.rendered}' > ../../ansible/inventory"
    }
}

resource "aws_instance" "jenkins_instance" {
    ami = "ami-0a63f96e85105c6d3"
    instance_type = "t2.micro"
    key_name = "infra-key"

    tags = {
        Name = "${var.name}"
    }
    provisioner "remote-exec" {

    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = file(var.ssh_key_private)
      host        = aws_instance.jenkins_instance.public_dns
      timeout = "500s"
    }

  }

  provisioner "local-exec" {
    working_dir = "../../ansible"
    # command = "sleep 60; ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -u ubuntu --private-key ${var.ssh_key_private} -i '${aws_instance.jenkins_instance.public_dns},' jenkins.yaml"
    command = "ansible-playbook -i inventory jenkins.yaml"
  }
}