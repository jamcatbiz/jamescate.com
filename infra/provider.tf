terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
  default_tags {
    tags = {
      environment     = var.environment
      project         = var.project
      source          = var.source_control
      version         = var.source_version
      terraform-state = "${var.tf_state_bucket}/${var.tf_state_key}"
    }
  }
}