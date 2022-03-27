variable "region" {
  type    = string
  default = "ap-southeast-1"
}

variable "az_1" {
  type    = string
  default = "ap-southeast-1a"
}

variable "az_2" {
  type    = string
  default = "ap-southeast-1b"
}

variable "ami_id" {
  type = map
  default = {
    ap-southeast-1 = "ami-0615132a0f36d24f4"
  }
}

variable "instance_type" {
  type    = string
  default = "t2.nano"
}

variable "s3_tf_backend" {
  type    = string
  default = "tf-state-backend"
}

variable "jenkins_tf_tags" {
  type    = string
  default = "my-jenkins"
}
