# Terraform Settings Block
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      #version = "~> 3.21" # Optional but recommended in production
    }
  }
}

# Provider Block
provider "aws" {
  profile = "default" # AWS Credentials Profile configured on your local desktop terminal  $HOME/.aws/credentials
  region  = var.aws_region
}

# Resource Block
# Create EC2 Instance - Amazon Linux
resource "aws_instance" "my-ec2-vm" {
  ami           = data.aws_ami.amz_linux.id
  instance_type = var.instance_type
  key_name      = "Terraform-key"
	user_data = file("apache-install.sh")  
  vpc_security_group_ids = [aws_security_group.vpc_ssh.id, aws_security_group.vpc_web.id]
  tags = {
    "Name" = "amz-linux-vm"
  }
}