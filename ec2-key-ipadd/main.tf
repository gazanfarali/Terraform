provider "aws" {
  version = "~> 2.0"
  region  = "eu-west-2"
}

# creating EC2 instance with existing aws key pair
resource "aws_instance" "viaterraform" {
    ami     =  "ami-06178cf087598769c"
    instance_type = "t2.micro"
    key_name  = "Faisal-07-2020" # change this to yours existing aws key_pair

}

# creating function to get ip address as output, this will be correspond to output.tf file.
resource "aws_eip" "ip" {
  vpc      = true
  instance = aws_instance.viaterraform.id
}

# copying script to resource and exicuting it https://www.terraform.io/docs/provisioners/remote-exec.html
provisioner "file" {
  source      = "install.bash"
  destination = "/tmp/install.bash"
}

provisioner "file" {
  source      = "verify.sh"
  destination = "/tmp/verify.sh"
}

provisioner "remote-exec" {
  inline = [
    "chmod +x /tmp/install.bash",
    "/tmp/install.bash args",
  ]
}