variable "instance_type" {
  description = "Ec2 Instance_type"
  type        = string
  default     = "t2.micro"
}

variable "ami_id" {
  description = "EC2 ami_id"
  type        = string
  default     = "ami-00dc6d07c0a114859"

}