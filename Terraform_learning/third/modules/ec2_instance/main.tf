provider "aws" {
  region = "ap-south-2"
}

resource "aws_instance" "myserver" {
  ami           = var.ami_value
  instance_type = var.instance_type_value
  subnet_id     = var.subnet_id_value
  key_name      = var.aws_private_key

  tags = {
    Name = "Webserver"
  }
}

