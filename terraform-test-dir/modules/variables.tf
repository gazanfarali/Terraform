variable "acl" {
  type    = string
  default = "public"
}

variable "tags" {
  type    = map
  default = {
      Name = "My Bucket test repo"
      Environment = "Dev"
      created_by = "Syed"
      purpose = "logs"
  }
}


variable "bucket" {
  type    = string
  default = "bis-test-bucket-"
}
