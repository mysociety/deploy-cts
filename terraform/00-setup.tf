terraform {
  backend "s3" {}
}

variable "aws_region" {
  description = "AWS region to hold the resources"
  default     = "eu-west-1"
}

variable "app_user" {
  description = "IAM username for accessing AWS resources"
  default     = "ctsstaging"
}

variable "bucket_name_suffix" {
  description = "Suffix for the name of the bucket for the Uploads. Will be prefixed with ms-."
  default     = "cts-staging-mysociety-org"
}

variable "expire_version_days" {
  description = "Number of days before versions expire from the bucket"
  default     = 28
}

variable "base_vhost_url" {
  description = "Base URL for vhost accessing the resources"
  default     = "cts.staging.mysociety.org"
}

provider "aws" {
  region  = "${var.aws_region}"
  version = "~> 2.1"
}
