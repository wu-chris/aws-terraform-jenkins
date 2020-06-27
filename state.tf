terraform {
  backend "s3" {
    encrypt = true
    bucket  = "chriswu-tf-state-files"
    key     = "jenkins/terraform.state"
    region  = "ap-southeast-1"
  }
}
