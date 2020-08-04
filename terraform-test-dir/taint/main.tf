

provider "aws" {
  version = "~> 3.0.0"
  region  = "eu-west-2"
}



module "test_s3_bis_bucket" {
  source = "./module"
}
