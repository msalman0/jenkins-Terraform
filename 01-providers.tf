terraform {
  backend "remote" {
    hostname= "app.terraform.io"
    organization = "salman0-org"
    workspaces {
      name = "my-app-dev"
    }
  }
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.21"
    }
  }
}

# Provider configuration
provider "aws" {
  region = var.region
  profile = var.profile
}

