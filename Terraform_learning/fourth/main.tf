provider "aws" {
  region = "ap-south-2"
}

resource "aws_instance" "fouth_lab" {

  ami           = "ami-053a0835435bf4f45"
  instance_type = "t3.micro"
  subnet_id     = "subnet-0e1f40602c1341bd0"
  key_name      = "my_test_key"

  tags = {
    Name = "Fourth_lab"
  }
}

resource "aws_s3_bucket" "my_test_bucket" {
    bucket = "my-test-bucket-anoop-raturi-5825610"

    tags = {
      Name = "my-test-bucket-anoop-raturi-5825610"
    }
  
}

resource "aws_dynamodb_table" "terraform-lock" {
    name = "terraform-lock"
    billing_mode = "PAY_PER_REQUEST"
    hash_key = "LockID"

    attribute {
      name = "LockID"
      type = "S"
    }
  
}