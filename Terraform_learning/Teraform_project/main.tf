resource "aws_vpc" "Test_vpc" {
  cidr_block = var.cidr
  tags = {
    Name = "Test_vpc"
  }
}

resource "aws_subnet" "SUB1" {
  vpc_id                  = aws_vpc.Test_vpc.id
  cidr_block              = "10.0.0.0/24"
  availability_zone       = "ap-south-2a"
  map_public_ip_on_launch = true
  tags = {
    Name = "SUBNET1"
  }
}

resource "aws_subnet" "SUB2" {
  vpc_id                  = aws_vpc.Test_vpc.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "ap-south-2b"
  map_public_ip_on_launch = true
  tags = {
    Name = "SUBNET2"
  }
}

resource "aws_internet_gateway" "IGW" {
  vpc_id = aws_vpc.Test_vpc.id
  tags = {
    Name = "MY_IGW"
  }
}

resource "aws_route_table" "RT" {
  vpc_id = aws_vpc.Test_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.IGW.id
  }
  tags = {
    Name = "Route_table_1"
  }
}

resource "aws_route_table_association" "RTA1" {
  subnet_id      = aws_subnet.SUB1.id
  route_table_id = aws_route_table.RT.id
}

resource "aws_route_table_association" "RTA2" {
  subnet_id      = aws_subnet.SUB2.id
  route_table_id = aws_route_table.RT.id
}

resource "aws_security_group" "My-Sg" {
  name        = "websg"
  description = "Allow ports for inbound"
  vpc_id      = aws_vpc.Test_vpc.id

  tags = {
    Name = "My-Sg"
  }

  ingress {
    description = "Inbound port opening for VPC"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "SSH"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_s3_bucket" "My-S3" {
  bucket = "my-terraform-s3-bucket-570793"
  tags = {
    Name = "my-terraform-s3-bucket-570793"
  }
}

/*resource "aws_s3_bucket_public_access_block" "My-S3" {
  bucket = aws_s3_bucket.My-S3.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_acl" "My-S3" {
  /*depends_on = [
    aws_s3_bucket_ownership_controls.My-S3,
    aws_s3_bucket_public_access_block.My-S3,
  ]

  bucket = aws_s3_bucket.My-S3.id
  acl    = "public-read"
}*/

resource "aws_instance" "webserver1" {
  ami                    = "ami-053a0835435bf4f45"
  instance_type          = "t3.micro"
  vpc_security_group_ids = [aws_security_group.My-Sg.id]
  subnet_id              = aws_subnet.SUB1.id
  user_data_base64       = base64encode(file("userdata.sh"))
  
  tags = {
    Name = "Webserver1"
  }
}


resource "aws_instance" "webserver2" {
  ami                    = "ami-053a0835435bf4f45"
  instance_type          = "t3.micro"
  vpc_security_group_ids = [aws_security_group.My-Sg.id]
  subnet_id              = aws_subnet.SUB2.id
  user_data              = base64encode(file("userdata1.sh"))
  
  tags = {
    Name = "Webserver2"
  }
}

#create ALB

resource "aws_lb" "ALB" {
  name               = "my-alb"
  internal           = false
  load_balancer_type = "application"

  security_groups = [aws_security_group.My-Sg.id]
  subnets         = [aws_subnet.SUB1.id, aws_subnet.SUB2.id]
}

resource "aws_lb_target_group" "ALB-TG" {
  name     = "web-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.Test_vpc.id

  health_check {
    path = "/"
    port = "traffic-port"
  }
}

resource "aws_lb_target_group_attachment" "attach1" {
  target_group_arn = aws_lb_target_group.ALB-TG.arn
  target_id        = aws_instance.webserver1.id
  port             = 80
}

resource "aws_lb_target_group_attachment" "attach2" {
  target_group_arn = aws_lb_target_group.ALB-TG.arn
  target_id        = aws_instance.webserver2.id
  port             = 80
}

resource "aws_lb_listener" "listener" {
  load_balancer_arn = aws_lb.ALB.arn
  port              = 80
  protocol          = "HTTP"
  default_action {
    target_group_arn = aws_lb_target_group.ALB-TG.arn
    type             = "forward"
    
  }
}

output "loadbalancerdns" {
  value = aws_lb.ALB.dns_name
}