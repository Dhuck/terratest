#variable "AWS_ACCESS_KEY_ID" {}
#variable "AWS_SECRET_ACCESS_KEY" {}

provider "aws" {
  region = "us-east-1"
  #profile    = "test_profile"
  #access_key = var.AWS_ACCESS_KEY_ID
  #secret_key = var.AWS_SECRET_KEY_ID
}

variable "bucket" {
  type    = string
  default = "trfs3course"
}

/*------------bucket------------*/

resource "aws_s3_bucket" "bucket1" {
  bucket = var.bucket
  #acl    = "public-read"
  #website {
  #  index_document = "index.html"
  #}
  tags = {
    Name        = "sr-tag"
    Environment = "Dev"
  }
}

variable "content" {
  type    = string
  default = "Text line"
}

/*------------content------------*/

resource "aws_s3_bucket_object" "bucket1" {
  bucket       = aws_s3_bucket.bucket1.bucket
  key          = "index.html"
  acl          = "public-read"
  content      = var.content
  content_type = "text/html"
}
