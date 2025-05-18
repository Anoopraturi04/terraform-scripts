provider "aws" {
  region = "ap-south-2"
}

module "ec2_instance" {
  source = "./modules/ec2_instance"
  ami_value = "ami-053a0835435bf4f45"
  instance_type_value = "t3.micro"
  subnet_id_value = "subnet-0e1f40602c1341bd0"
  aws_private_key = "my_test_key"
    
}

