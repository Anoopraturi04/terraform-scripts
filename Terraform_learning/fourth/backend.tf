terraform {
  backend "s3" {
   bucket = "my-test-bucket-anoop-raturi-5825610"
   region = "ap-south-2"
   key = "anoop/terraform.tfstate"
   dynamodb_table = "terraform-lock"
  }
}
