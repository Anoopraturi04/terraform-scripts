output "public-ip-address" {
    value = aws_instance.myserver.public_ip
}