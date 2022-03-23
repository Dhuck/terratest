terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

variable "AWS_ACCESS_KEY_ID" {}
variable "AWS_SECRET_KEY_ID" {}

provider "aws" {
  access_key = var.AWS_ACCESS_KEY_ID
  secret_key = var.AWS_SECRET_KEY_ID
  region     = "us-east-1"
}

resource "aws_instance" "hello-instance" {
  ami           = "ami-0c02fb55956c7d316"
  instance_type = "t2.micro"
  tags = {
    Name = "hello-instance"
  }
}

