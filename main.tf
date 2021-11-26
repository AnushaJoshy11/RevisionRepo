terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 3.22"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.0.1"
    }
  }
  required_version = ">= 0.14"

  backend "remote" {
    organization = "TestAnushaOrg"

    workspaces {
      name = "RevisionRepo"
    }
    token = "SEGRy0EFQ9UOmw.atlasv1.Ts6iRCWIPMscfQeCSGiQ509cjo7vhSQ56cHeI411nynSnSoqrDooBzIdhWekgMGm4sM"
  }
}


provider "aws" {
  region = "us-west-2"
}

  module "sns_topic" {
    source  = "terraform-aws-modules/sns/aws"
    version = "~> 3.0"

    name = "myterraformsns-topic"
  }

  module "s3_bucket" {
    source = "terraform-aws-modules/s3-bucket/aws"

    bucket = "my-s3-bucket"
    acl    = "private"

    versioning = {
      enabled = true
    }

  }
