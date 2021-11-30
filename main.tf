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
  default_tags {
  tags = {
    Environment = "Test"
    Name        = "Provider Tags"
    versiontag  = "0.3.0"
    Additinaltag = "test123"
  }
}
}

  module "sns_topic" {
    source  = "terraform-aws-modules/sns/aws"
    version = "~> 3.0"

    name = "myterraformgitsns123"
  }

  module "s3_bucket" {
    source = "terraform-aws-modules/s3-bucket/aws"

    bucket = "my-s3-bucket"
    acl    = "private"
    versioning = {
      enabled = true
    }
    #server_side_encryption_configuration = var.server_side_encryption_configuration
    server_side_encryption_configuration = {
      rule = {
        apply_server_side_encryption_by_default = {
         # kms_master_key_id = aws_kms_key.mykey.arn
          sse_algorithm     = "aws:kms"
        }
      }
    }   
  }


  # resource "aws_kms_key" "mykey" {
  #   description             = "This key is used to encrypt bucket objects"
  #   deletion_window_in_days = 10
  # }

# resource "aws_s3_bucket" "mybucket" {
#   bucket = "mybucket"

#   server_side_encryption_configuration {
#     rule {
#       apply_server_side_encryption_by_default {
#         kms_master_key_id = aws_kms_key.mykey.arn
#         sse_algorithm     = "aws:kms"
#       }
#     }
#   }
# }
