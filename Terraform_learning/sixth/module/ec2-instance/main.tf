provider "aws" {
    region = "ap-south-2"
}


variable "ami" {
    description = "This is AMI for the Instance"
}

variable "instance_type" {
    description = "This is the instance-type for the server"  
}

/*variable "tags" {
    description = "tags for diferent enviornment"
}*/


resource "aws_instance" "myserver" {
    ami = var.ami
    instance_type = var.instance_type
    tags = {
      Name = "Dev-webserver"
    }

}
