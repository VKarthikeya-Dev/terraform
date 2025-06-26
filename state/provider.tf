terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.98.0"
    }
  }
  backend "s3" {
    bucket = "vk-remote-state"
    key    = "remote-state-demo"
    region = "us-east-1"
    dynamodb_table ="vk-remote-state"
  }
}

provider "aws" {
  # Configuration options
}