terraform {
  backend "s3" {
    encrypt = true
    bucket  = "tf-state-backend"
    key     = "jenkins/terraform.state"
    region  = "ap-southeast-1"
  }
}
