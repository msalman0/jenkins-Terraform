# core

variable "account" {
  description = "The AWS Account Number (10 digit) to create resources in."
  default     = "786876608374"
}

variable "profile" {
  description = "The AWS profile"
  default     = "tf_user"
}

variable "region" {
  description = "The AWS region to create resources in."
  default     = "eu-west-1"
}


# networking

variable "vpc_cidr" {
  description = "CIDR Block for VPC"
  default     = "10.0.0.0/16"
}
variable "public_subnet_1_cidr" {
  description = "CIDR Block for Public Subnet 1"
  default     = "10.0.1.0/24"
}
variable "public_subnet_2_cidr" {
  description = "CIDR Block for Public Subnet 2"
  default     = "10.0.2.0/24"
}
variable "private_subnet_1_cidr" {
  description = "CIDR Block for Private Subnet 1"
  default     = "10.0.3.0/24"
}
variable "private_subnet_2_cidr" {
  description = "CIDR Block for Public Subnet 2"
  default     = "10.0.4.0/24"
}
variable "availability_zones" {
  description = "Availability zones"
  type        = list(string)
  default     = ["eu-west-1a", "eu-west-1b", "eu-west-1c"]
}


# load balancer

variable "health_check_path" {
  description = "Health check path for the default target group"
  default     = "/"
}

variable "amis" {
  description = "Which AMI to spawn."
  default = {
    eu-west-1 = "ami-07355fe79b493752d"
    eu-west-2 = "ami-07355fe79b493752d"
  }
}
variable "instance_type" {
  default = "t2.micro"
}

variable "ec2_instance_name" {
  description = "Name of the EC2 instance"
  default     = "terraform-lab"
}


# key pair - Location to the SSH Key generate using openssl or ssh-keygen or AWS KeyPair
variable "ssh_pubkey_file" {
  description = "Path to an SSH public key"
  default     = "C:/Users/14337/.ssh/id_ed25519.pub"
}


# auto scaling

variable "autoscale_min" {
  description = "Minimum autoscale (number of EC2)"
  default     = "2"
}
variable "autoscale_max" {
  description = "Maximum autoscale (number of EC2)"
  default     = "2"
}
variable "autoscale_desired" {
  description = "Desired autoscale (number of EC2)"
  default     = "2"
}

variable "ec2-bastion-private-key-path" {
  description = "ec2-bastion-private-key-path"
  default     = "./ec2-bastion-key-pair.pem"
}

## EC2 Bastion Host Variables
variable "ec2-bastion-public-key-path" {
  description = "ec2-bastion-public-key-path"
  default     = "./ec2-bastion-key-pair.pub"
}