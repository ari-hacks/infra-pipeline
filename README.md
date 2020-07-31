# Infrastructure pipeline using Jenkins, Terraform, AWS, and Ansible

## Pre-requisites
- [AWS account - free tier](https://aws.amazon.com/free/?all-free-tier.sort-by=item.additionalFields.SortRank&all-free-tier.sort-order=asc)
- AWS CLI
  - mac: `brew install awscli` | `aws --version`
  - windows: [instructions](https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2-windows.html)
  - linux: [instructions](https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2-linux.html)
- [Terraform](https://learn.hashicorp.com/terraform/getting-started/install.html)
- [Ansible](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html)
- [Docker](https://docs.docker.com/desktop/)
- Python 

## Setup Steps 

- Create an IAM user with programmatic access and administrator access. See detailed instructions [here](https://github.com/ari-hacks/terraform-aws-automation/blob/master/README.md)
- Configure AWS CLI locally for development with: `aws configure`
- Add two EC2 instances to AWS one for the Jenkins server and one for the containerized python service 
- Setup ssh key pair 
