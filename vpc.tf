# Create a VPC
resource "aws_vpc" "myfrst" {
  cidr_block = var.cidr_range
   tags = {
    Name = "myfrst"
  }
}