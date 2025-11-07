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
# calling module 

module "my-gsk-module-ec2" {
    source = "./modules/ec2"
    vm-name = "gsk-vm-1-day-final"
    vm-size = "t2.nano"
    ec2-key-name = "gsk-key-final"
    gsk-ami-id = "ami-0a25a306450a2cba3"
    private-key-algo= "RSA"
    key-size = 4096
    my-vpc-id="vpc-02d56e9aa1ce2f114"
    my-sec-group-name = "gsk-sec-group"
    novm = 2

}