  provider "aws" {
    version = "~> 3.0.0"
    region = "eu-west-2"
  }

  resource "aws_s3_bucket" "foo" {
  bucket = "cf-templates-x3i832raup6a-eu-west-2"
  acl = "private"

}