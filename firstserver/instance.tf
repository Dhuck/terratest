terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  access_key = "xxxxxxxxxxxxxxxxxxxxxx"
  secret_key = "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
  region = "us-east-1"
}

resource "aws_instance" "hello-instance" {
  ami = "ami-0c02fb55956c7d316"
  instance_type = "t2.micro"
  tags = {
    Name = "hello-instance"
  }
}

