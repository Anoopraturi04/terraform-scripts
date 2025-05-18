provider "aws" {
  region = "ap-south-2"
}

variable "ami" {
  description = "This is the AMI for the ec2 server"
}

variable "instance_type" {
  description = "This is the instance-type for the server"
  type = map(string)

    default = {
      "dev" = "t3.micro"
      "stage" = "t3.small"
      "prod"  = "t3.medium"
    }  
}
/*variable "tags" {
    description = "tags for diferent enviornment"
    type = map(string)

    default = {
      "dev" = "Dev-server"
      "stage"= "Staging-server"
      "prod"= "Prod-server"
    }
}*/
module "ec2-instance" {
  source        = "./module/ec2-instance/"
  ami           = var.ami
  instance_type = lookup(var.instance_type, terraform.workspace, "t3.micro")
  /*tags = {
    Name = lookup(var.tags, terraform.workspace, "Dev-server")
  }*/
}