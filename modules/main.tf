# VPC creation
resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr_block
}

# Public subnet creation
resource "aws_subnet" "public" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.public_subnet_cidr
  availability_zone       = var.availability_zone
}

# Private subnet creation
resource "aws_subnet" "private" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = var.private_subnet_cidr
  availability_zone       = "us-west-2b"
}

output "public_subnet_id" {
  value = aws_subnet.public.id
}
