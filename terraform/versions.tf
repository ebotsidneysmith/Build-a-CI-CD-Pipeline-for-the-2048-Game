terraform {
  required_version = ">= 1.6.0"

  # Provide non-empty placeholder values so init can parse before we override via -backend-config.
  backend "s3" {
    bucket         = "placeholder-bucket"
    key            = "placeholder.tfstate"
    region         = "us-east-1"
    dynamodb_table = "placeholder-locks"
    encrypt        = true
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.53"
    }
  }
}

provider "aws" {
  region = var.region
}
