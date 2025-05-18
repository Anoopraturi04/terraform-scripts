provider "aws" {
  region = "ap-northeast-3"

}

resource "aws_instance" "webserver" {
  ami           = var.ami_id
  instance_type = var.instance_type
  tags = {
    Name = "SERVER1"
  }

}

output "public_ip" {
  description = "Public ip address of the ec2 "
  value       = aws_instance.webserver.public_ip

}
