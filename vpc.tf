resource "aws_vpc" "main" {
  cidr_block       = "172.16.0.0/20"
  instance_tenancy = "default"
  tags = {
    Name = "iguwo-test"
  }
}