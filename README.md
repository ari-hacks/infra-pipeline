# Infrastructure pipeline

### Pipeline Features
- [ ] Jenkins 
  - [ ] Server
  - [ ] Slack plugin 
- [ ] Terraform 
  - [ ] AWS EC2 instance resources 
  - [ ] Remote state 
- [ ] AWS
  - [ ] Key Pair for SSH
  - [ ] Two EC2 instances
- [ ] Ansible 
  - [ ] Jenkins playbook
  - [ ] Web playbook 
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
- Python 3.8

### Running the service locally 

1. Clone this repository and `cd` into it 
   ```BASH
    → git clone https://github.com/ari-hacks/infra-pipeline.git

    → cd infra-pipeline
    ```

    ```BASH 
    → pytest
    ```
2. Pipenv dependency management 
   
    ```BASH
      #run pipenv 
    → pipenv shell
    ```
    ```BASH
      #install dependencies  
    → pipenv install
    ```
3. [Install & Run in docker](https://hub.docker.com/) 
4. Build Docker Image 
    ```bash
    ➜ docker build -t app .
    ```
5. Start Docker container 
    ```bash
    ➜ docker run -d --name infra-pipeline-container -p 5000:5000 app
    ```
6. Run the application
   ```bash 
    Uvicorn running on http://0.0.0.0:5000/users/health-check 
    #or 
    http://localhost:5000/users/health-check
   ```
7. Check the logs 
   ```bash 
   ➜ docker container logs -f infra-pipeline-container
   ```

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
   ubuntu@<dns> ansible_ssh_key_private_file=~/.ssh/infra-key.pem
   [webservers]
   ubuntu@<dns> ansible_ssh_key_private_file=~/.ssh/infra-key.pem 
   ```
3. Run Playbooks
   
   navigate to: `\ansible`

   `sudo ansible-playbook jenkins.yaml`

   `sudo ansible-playbook web.yaml`

4. Configure Jenkins 
