provider "aws" {
  region = "ap-northeast-3"
}

resource "aws_instance" "webserver" {

  ami           = "ami-08a7bc2c4efd0df53"
  instance_type = "t2.micro"

  tags = {
    Name = "Server1"
  }
}