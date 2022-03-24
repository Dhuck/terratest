provider "aws" {
  region = var.aws_region
}

terraform {
  backend "s3" {
    bucket = "trf-s3-backend-qs3604gww-state-bucket"
    key    = "state/statevpc"
    region = "us-east-1"
  }
}

resource "aws_vpc" "vpc1" {
  cidr_block = var.vpc_cidr
  tags = {
    Name = var.vpc_name
  }

}

resource "aws_subnet" "subnet1" {
  vpc_id            = aws_vpc.vpc1.id
  cidr_block        = var.subnet_cidr[0]
  availability_zone = var.az[2]
  tags = {
    Name = var.subnet_name[1]
  }
}

resource "tls_private_key" "key" {
  algorithm = "RSA"
}

resource "local_file" "private_key" {
  filename          = "${path.module}/ansible-key.pem"
  sensitive_content = tls_private_key.key.private_key_pem
  file_permission   = "0400"
}

resource "aws_key_pair" "key_pair" {
  key_name   = "ansible-key-trf"
  public_key = tls_private_key.key.public_key_openssh
}

