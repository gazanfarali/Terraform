  provider "aws" {
    version = "~> 3.0.0"
    region = "eu-west-2"
  }



module "import-s3" {
  source = "./module"
}
