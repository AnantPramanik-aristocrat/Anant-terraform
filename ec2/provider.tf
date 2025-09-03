terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.10.0"
    }
  }
  backend "s3" {
    bucket  = "anant-terraform-state4"
    key     = "dev-env/terraform.tfstate"
    region  = "us-east-2"
    encrypt = true
    acl     = "private"
    # make sure dynamodb table is present 
    dynamodb_table = "anant-terraform-table4"
  }
}


provider "aws" {
    region = var.region
    access_key = ${{ secrets.AWS_ACCESS_KEY}}
    secret_key = ${{ secrets.AWS_SECRET_KEY}}
}

