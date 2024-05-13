# Provider configuration
provider "aws" {
  region = var.region
}

# VPC module
module "vpc" {
  source = "./modules/vpc"

  vpc_cidr_block       = var.vpc_cidr_block
  public_subnet_cidr   = var.public_subnet_cidr
  private_subnet_cidr  = var.private_subnet_cidr
}

# EC2 instance module
module "ec2_instance" {
  source = "./modules/ec2_instance"

  subnet_id = module.vpc.public_subnet_id
  ami       = var.ami
  instance_type = var.instance_type
  availability_zone = var.availability_zone
}

# Output
output "public_ip" {
  value = module.ec2_instance.public_ip
}

output "jenkins_url" {
  value = "http://${module.ec2_instance.public_ip}:8080"
}
