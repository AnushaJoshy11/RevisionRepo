terraform {
required_providers {
test = {
source = "terraform.io/builtin/test"
}
}
}

provider "aws" {
region = "us-west-2"
}

locals {
sns_topic_arn = "arn:aws:sns:us-west-2:872574567236:${random_string.random.result}"
}

resource "random_string" "random" {
length = 16
special = false
number = false
}

module "sns" {
source = "../.."
}

resource "test_assertions" "sns" {

component = "sns"

equal "arn" {
description = "Check SNS topic ARN output"
got = local.sns_topic_arn
want = local.sns_topic_arn
}
}