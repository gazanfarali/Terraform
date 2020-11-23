provider "aws" {
  version = "~> 2.0"
  region  = "eu-west-2"
}


resource "aws_instance" "viaterraform" {
    ami     =  "ami-06178cf087598769c"
    instance_type = "t2.micro"
    key_name  = "Faisal-07-2020"

}

resource "aws_eip" "ip" {
  vpc      = true
  instance = aws_instance.viaterraform.id
}
