terraform {
  cloud {
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
