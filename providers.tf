terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.69.0"
    }
  }
  # cloud {

  #   organization = "Manoj_Gonchala"

  #   workspaces {
  #     name = "terraform"
  #   }
  }
#}

provider "aws" {
  # Configuration options
  region = "ap-south-1"
}
