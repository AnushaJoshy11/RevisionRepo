# terraform {
#   required_providers {
#     aws = {
#       source  = "hashicorp/aws"
#       version = "3.26.0"
#     }
#     # random = {
#     #   source  = "hashicorp/randomcd"
#     #   version = "3.0.1"
#     # }
#   }
#   required_version = ">= 0.14"

#   backend "remote" {
#     organization = "TestAnushaOrg"

#     workspaces {
#       name = "RevisionRepo"
#     }
#     token = "SEGRy0EFQ9UOmw.atlasv1.Ts6iRCWIPMscfQeCSGiQ509cjo7vhSQ56cHeI411nynSnSoqrDooBzIdhWekgMGm4sM"
#   }
# }


# provider "aws" {
#   region = "us-west-2"
# }



# resource "random_pet" "sg" {}

# resource "aws_instance" "web" {
#   ami                    = "ami-830c94e3"
#   instance_type          = "t2.micro"
#   vpc_security_group_ids = [aws_security_group.web-sg.id]

#   user_data = <<-EOF
#               #!/bin/bash
#               echo "Hello, World" > index.html
#               nohup busybox httpd -f -p 8080 &
#               EOF
# }

# resource "aws_security_group" "web-sg" {
#   name = "${random_pet.sg.id}-sg"
#   ingress {
#     from_port   = 80
#     to_port     = 80
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }
# }

# output "web-address" {
#   value = "${aws_instance.web.public_dns}:8080"
# }

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.66.0"
    }
  }

  required_version = ">= 0.14.9"
}

provider "aws" {
  profile = "default"
  region  = "us-east-1"
}


terraform {
  backend "remote" {
    organization = "TestAnushaOrg"

    workspaces {
      name = "RevisionRepo"
    }
    token = "SEGRy0EFQ9UOmw.atlasv1.Ts6iRCWIPMscfQeCSGiQ509cjo7vhSQ56cHeI411nynSnSoqrDooBzIdhWekgMGm4sM"
  }
}

# module "ec2_instance" {
#   source  = "terraform-aws-modules/ec2-instance/aws"
#   version = "~> 3.0"

#   name          = var.ec2_name
#   ami           = "ami-0416f96ae3d1a3f29"
#   instance_type = "t2.micro"
#   key_name      = "anushakeypair"
#   monitoring    = true
#   #vpc_security_group_ids = [module.vpc.default_security_group_id]
#   vpc_security_group_ids = var.security_group_ids
#   subnet_id              = var.subnet_id
#   availability_zone = var.availability_zone

#   tags =  {
#     Terraform   = "true"
#     Environment = "dev" 
#   }
# }

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
