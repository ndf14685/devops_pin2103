provider "aws" {
    region = "us-east-2"
}

resource "aws_instance" "Jenkins" {
	ami = "ami-0f597975071f4c4ec"
	instance_type = "t2.micro"
    key_name = "Jenkins"

    security_groups = [ "launch-wizard-2" ]

    user_data = <<-EOF
    #!/bin/bash
    sudo apt-get update
    sudo apt-get install -y openjdk-8-jdk
    wget -q -O - https://pkg.jenkins.io/debian/jenkins-ci.org.key | sudo apt-key add -
    sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
    sudo apt-get update
    sudo apt-get install -y jenkins
    #echo "Copying the SSH Key Of Jenkins to the server"
    #echo -e "#Jenkins\nssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAAB*******************F/SNZPMT4Qm/RVgBbIhG8VsoDhGM0tgIzWyTaNxDPSDx/yzJ8FQwCKOH6YR3RugLvTU+jDKvI8BWOnMM5cgrbfKbBssUyJSdWI86py4bi05A3X6O5+6xS6IvQbZwlbJiu/DbgAcvGLiq1mDi77O+DvU22RNgCB9hGddryWc3nTDOMyVaex5EdfvgxEli1DAM2YYr/DdxVvdzkrP/1fol6t+XT4FeQyW/KcQuRA53qG0aSYlSN/6NUO3OGuLn jenkins@gritfy.com\nssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAAPlhbcDQ06FO8euMxVvsglV4gqhD0v1l8h+bk/X+eJWqQMHZ0CXzsywTe+32zdu9JydbwiQiMIlDwFy0nsyX+quzLupYejrAtFFOKoFSzNB3ng69KSV+M6kUZdXHfP9PjYt5wZfOW0h/W9+2Oz406UjpeaW5t9XPftx784nLsocR3d7mosIgLMXkFLijOfJknhEKWxMmvkwV15fcuPfpRhvJkFDCmpFMBTaOwE2rDuj22r0Z4bI78CdtZgTSB5eK1YebOtEUllB+pwoMA40cNgnivd ubuntu@gritfy.com" >> /home/ubuntu/.ssh/authorized_keys
    # Update package manager sources
    
    #Install unzip
    sudo apt install unzip
    # Download AWS CLI https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2-linux.html#cliv2-linux-install
    curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
    # Unzip and install the AWS CLI Console
    unzip awscliv2.zip
    sudo ./aws/install
    # Download EKS CLI https://github.com/weaveworks/eksctl
    curl --silent --location "https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_$(uname -s)_amd64.tar.gz" | tar xz -C /tmp
    # Move eksctl to /usr/local/bin
    sudo mv /tmp/eksctl /usr/local/bin

    # Download last version of kubectl
    curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
    # Install kubectl
    sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

    #Install Docker from snap
    sudo snap install docker

    # Adding Docker group and setting permissions
    sudo groupadd docker
    sudo usermod -aG docker ubuntu

    # Install HELM (Debian/Ubuntu) https://helm.sh/es/docs/intro/install/
    curl https://baltocdn.com/helm/signing.asc | sudo apt-key add -
    sudo apt-get install apt-transport-https --yes
    echo "deb https://baltocdn.com/helm/stable/debian/ all main" | sudo tee /etc/apt/sources.list.d/helm-stable-debian.list
    sudo apt-get update
    sudo apt-get install helm

    # aws IAM Authenticator
    curl -o aws-iam-authenticator https://amazon-eks.s3.us-west-2.amazonaws.com/1.19.6/2021-01-05/bin/linux/amd64/aws-iam-authenticator

    ## Install Terraform

    # Add Hashicorp gpg signature
    curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -

    # Add HashiCorp package repository
    sudo apt-add-repository "deb [arch=$(dpkg --print-architecture)] https://apt.releases.hashicorp.com $(lsb_release -cs) main"

    # Update package manager sources
    sudo apt update

    # Install Terraform
    sudo apt install terraform

    sudo service jenkins start
    EOF
}  