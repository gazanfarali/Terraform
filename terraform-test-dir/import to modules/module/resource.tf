
resource "aws_s3_bucket" "foo" {
  bucket = "import-as-module-test"
  acl    = "private"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}