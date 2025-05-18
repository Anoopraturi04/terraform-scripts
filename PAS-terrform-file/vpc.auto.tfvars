# VPC Variables
vpc_name = "prizm-pas"
vpc_cidr_block = "11.0.0.0/16"
#vpc_availability_zones = ["ap-south-1a", "ap-south-1b"]
vpc_public_subnets = ["11.0.101.0/24", "11.0.102.0/24"]
vpc_private_subnets = ["11.0.1.0/24", "11.0.2.0/24"]
vpc_database_subnets= ["11.0.151.0/24", "11.0.152.0/24"]
vpc_create_database_subnet_group = true 
vpc_create_database_subnet_route_table = true   
vpc_enable_nat_gateway = true  
vpc_single_nat_gateway = true
