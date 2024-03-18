terraform {
  backend "s3" {
    bucket                  = "tf-state-ecr-aika"
    # dynamodb_table          = "tf-state-ecr-aika"
    key                     = "tf-ecr"
    region                  = "us-east-1"
    # shared_credentials_file = "~/.aws/credentials"
  }
}

provider "aws" {
  region = "us-east-1" # Set your desired AWS region
}

resource "aws_ecr_repository" "my_ecr_repo" {
  name                 = "my-ecr-repo" # Set the name for your ECR repository
  image_tag_mutability = "IMMUTABLE"   # Can be "MUTABLE" or "IMMUTABLE". Determines whether images are mutable or immutable
  image_scanning_configuration {
    scan_on_push = true
  }
}