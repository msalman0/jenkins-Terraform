terraform {
  backend "remote" {
    hostname= "app.terraform.io"
    organization = "salman0-org"
    workspaces {
      name = "my-app-dev"
    }
  }
}

# Provider configuration
provider "aws" {
  region = var.region
  profile = var.profile
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.74.2"
    }
  }
}