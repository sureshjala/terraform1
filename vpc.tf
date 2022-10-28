# Create a VPC
resource "aws_vpc" "myfrst" {
  cidr_block = var.cidr_range
   tags = {
    Name = "myfrst"
  }
}
resource "aws_subnet" "app1" {
  vpc_id     = aws_vpc.myfrst.id #implisity
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "app1"
depends_on = [
    aws_vpc.myfrst #explicity
]
  }
}
resource "aws_subnet" "web1" {
  vpc_id     = aws_vpc.myfrst.id #implisity
  cidr_block = "10.0.2.0/24"

  tags = {
    Name = "web1"
    depends_on = [
    aws_subnet.app1 #explicity
]
  }
}
resource "aws_subnet" "db1" {
  vpc_id     = aws_vpc.myfrst.id #implisity
  cidr_block = "10.0.3.0/24"

  tags = {
    Name = "db1"
    depends_on = [
    aws_subnet.web1 #explicity
]
  }
}