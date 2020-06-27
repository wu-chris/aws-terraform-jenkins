provider "aws" {
  region  = var.region
  version = "~> 2.0"
}

variable "region" {
  type    = string
  default = "ap-southeast-1"
}
