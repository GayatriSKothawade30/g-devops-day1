terraform {

  backend "s3" {
    bucket         = "gsk-roche-terraform-bucket"
    key            = "dev/gsk/terraform.tfstate"
    region         = "ap-southeast-2"
    dynamodb_table = "gsk-roche-table1"
    encrypt        = true
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.19.0"
    }
  }

}

provider "aws" {
  # Configuration options
  region = "ap-southeast-2"
}
