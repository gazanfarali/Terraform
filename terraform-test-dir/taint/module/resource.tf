
resource "aws_s3_bucket" "foo" {
  bucket = "import-as-module-test"
  acl    = "private"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}

resource "aws_s3_bucket" "bar" {
  bucket = "import-as-module-test-22"
  acl    = "private"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}