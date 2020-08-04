# Infrastructure pipeline

### Pipeline Features
- [x] Jenkins 
  - [x] Server
  - [ ] Slack plugin (configuration link)
  - [ ] Integrate Github
- [ ] Terraform 
  - [x] AWS EC2 instance resources 
  - [ ] Remote state 
- [x] AWS
  - [x] Key Pair for SSH
  - [x] Two EC2 instances
- [x] Ansible 
  - [x] Jenkins playbook
  - [x] Web playbook 
- [x] Docker
  - [x] Containerized FastApi service 
  - [x] Build & Push tagged repo to docker hub
- [ ] Terratest (Infrastructure testing)
  - [ ] Docker
  - [ ] Terraform

## Set up

### Requirements
- [AWS account - free tier](https://aws.amazon.com/free/?all-free-tier.sort-by=item.additionalFields.SortRank&all-free-tier.sort-order=asc)
- AWS CLI
  - mac: `brew install awscli` | `aws --version`
  - windows: [instructions](https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2-windows.html)
  - linux: [instructions](https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2-linux.html)
- Configure [AWS locally](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-quickstart.html) or use [AWS vault](https://github.com/99designs/aws-vault)
- [EC2 Key pair](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-key-pairs.html)
- [Jenkins](https://www.jenkins.io/)
- [Terraform](https://learn.hashicorp.com/terraform/getting-started/install.html)
- [Ansible](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html)
- [Docker](https://docs.docker.com/desktop/)
- Python 3.8
- Go 1.14
- [dep dependency](https://github.com/golang/dep) `brew install dep`
- Terratest globally installed `go get -v github.com/gruntwork-io/terratest`

### [Running the service locally](local-docker.md) 

### Deploying infrastructure

1. Create EC2 instances 
   
   navigate to: `\terraform\jenkins`

   ```BASH
    ➜ terraform init

    ➜ terraform plan

    ➜ terraform apply
   ```

   navigate to: `\terraform\web`

   ```BASH
    ➜ terraform init

    ➜ terraform plan

    ➜ terraform apply
   ```
2. Configure Ansible host configuration 
   
   navigate to: `\etc\ansible\host`

   ```INIT
   #servers and key config
   [jenkins]
   ubuntu@<public-dns> ansible_user=ubuntu ansible_ssh_key_private_file=~/.ssh/infra-key.pem
   [webservers]
   ubuntu@<public-dns> ansible_user=ubuntu ansible_ssh_key_private_file=~/.ssh/infra-key.pem 
   ```
3. Run Playbooks
   
   navigate to: `\ansible`

   `sudo ansible-playbook jenkins.yaml`

   `sudo ansible-playbook web.yaml`

4. Configure Jenkins and AWS EC2 instances


### Running Tests

  ```BASH
  ➜ cd test
  ➜ go test
  ```
