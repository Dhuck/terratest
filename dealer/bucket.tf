provider "aws" {
  region     = var.region
  profile    = "test_profile"
  access_key = xxxxx
  secret_key = xxxxxx
}

/*------------bucket------------*/

resource "aws_s3_bucket" "bucket1" {
  bucket = var.bucket
  acl    = "public-read"
  website {
    index_document = "index.html"
  }
}

/*------------content------------*/

resource "aws_s3_bucket_object" "object1" {
  bucket       = aws_s3_bucket.bucket1.bucket
  key          = "index.html"
  acl          = "public-read"
  content      = var.content
  content_type = "text/html"
}
