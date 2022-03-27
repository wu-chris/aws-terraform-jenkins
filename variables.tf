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
  type = map(any)
  default = {
    ap-southeast-1 = "ami-0615132a0f36d24f4"
  }
}

variable "instance_type" {
  type    = string
  default = "t2.nano"
}

variable "tf_state_bucket" {
  type = string
}

variable "tf_state_key" {
  type = string
}

variable "jenkins_tf_tags" {
  type    = string
  default = "my-jenkins"
}

variable "domain" {
  type = string
}
