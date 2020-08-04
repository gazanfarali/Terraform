
provider "aws" {
  version = "~> 3.0.0"
  region = "eu-west-2"
  }



resource "aws_s3_bucket" "b" {
  bucket = var.bucket
  acl = var.acl

  tags = var.tags

}