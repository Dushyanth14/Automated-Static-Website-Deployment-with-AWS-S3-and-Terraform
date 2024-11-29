terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.72.0"
    }
   random = {
      source  = "hashicorp/random"
      version = "3.6.2"
    }
  }
}
provider "aws" {
  region = "us-east-1"
}

resource "random_id" "s3-random-id" {
  byte_length = 8
  
}
resource "aws_s3_bucket" "static-website" {
  bucket = "static-website-${random_id.s3-random-id.hex}"
}

resource "aws_s3_bucket_public_access_block" "example" {
  bucket = aws_s3_bucket.static-website.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_policy" "mywebapp" {
  bucket = aws_s3_bucket.static-website.id
  policy = jsonencode(
    {
    Version = "2012-10-17",
    Statement = [
        {
            Sid = "PublicReadGetObject",
            Effect = "Allow",
            Principal = "*",
            Action = "s3:GetObject",
            Resource = "${aws_s3_bucket.static-website.arn}/*"
        }
      ]
     }
  )
}


resource "aws_s3_bucket_website_configuration" "mywebapp" {
  bucket = aws_s3_bucket.static-website.id

  index_document {
    suffix = "index.html"
  }
 }


resource "aws_s3_object" "index-html-file" {
  bucket = aws_s3_bucket.static-website.bucket
  source = "./index.html"
  key    = "index.html"
  content_type = "text/html"
}

resource "aws_s3_object" "styles-css-file" {
  bucket = aws_s3_bucket.static-website.bucket
  source = "./styles.css"
  key    = "styles.css"
  content_type = "text/css"
}


output "op-id" {
  value = aws_s3_bucket_website_configuration.mywebapp.website_endpoint
  
}
