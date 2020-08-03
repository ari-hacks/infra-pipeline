# Infrastructure pipeline

### Pipeline Features
- [ ] Jenkins 
  - [ ] Server
  - [ ] Slack plugin 
- [ ] Terraform 
  - [ ] Resources EC2 instances for web server and Jenkins 
  - [ ] Remote state 
- [ ] AWS
  - [ ] Key Pair 
  - [ ] Two Ec2 instances
- [ ] Ansible 
  - [ ] Jenkins playbook
  - [ ] web playbook 
- [ ] Docker
  - [ ] Containerized FastApi service 
- [ ] Terratest
  - [ ] Infrastructure testing 

## Set up

### Requirements
- [AWS account - free tier](https://aws.amazon.com/free/?all-free-tier.sort-by=item.additionalFields.SortRank&all-free-tier.sort-order=asc)
- [Jenkins](https://www.jenkins.io/)
- AWS CLI
  - mac: `brew install awscli` | `aws --version`
  - windows: [instructions](https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2-windows.html)
  - linux: [instructions](https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2-linux.html)
- [Terraform](https://learn.hashicorp.com/terraform/getting-started/install.html)
- [Ansible](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html)
- [Docker](https://docs.docker.com/desktop/)
- Python 

### Deploy steps


