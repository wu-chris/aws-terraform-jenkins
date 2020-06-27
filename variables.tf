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

variable "az_1" {
  type    = string
  default = "ap-southeast-1a"
}

variable "az_2" {
  type    = string
  default = "ap-southeast-1b"
}

variable "s3_jenkins_backup" {
  type    = string
  default = "chriswu-jenkins-backup"
}

variable "s3_tf_backend" {
  type    = string
  default = "chriswu-tf-state-files"
}

variable "jenkins_tf_tags" {
  type    = string
  default = "chriswu-jenkins"
}
