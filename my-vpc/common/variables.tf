variable "aws_region" {
  description = "Aws Region"
  default = "eu-west-1"
}

variable "availability_zone" {
  description = "availability zone name in which you want to create subnets"
  type = string
}

variable "vpc_name" {
  description = "VPC id for diffrent aws accounts"
  type = string
}

variable "subnet_name" {
  description = "network acl id for diffrent aws accounts"
  type = string
}

variable "vpc_cidr" {
  description = "ips to be denied which are passed using jenkinsfile"
}

variable "public_subnet_cidr" {
  description = "ips to be denied which are passed using jenkinsfile"
  type = list(string)
}

variable "igw_name" {
  description = "network acl id for diffrent aws accounts"
  type = string
}
