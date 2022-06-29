variable "image_id" {
  description = "Image ID used on EC2"
  type        = string
  default     = "ami-0c19f80dba70861db"
}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
  default     = "vpc-0047d70bf86bdf7ef"
}

variable "availability_zone" {
  description = "AWS availability zone"
  type        = string
  default     = "us-east-1a"
}

variable "region" {
  description = "AWS Region"
  type        = string
  default     = "us-east-1"
}

variable "name" {
  description = "Server name"
  type        = string
  default     = "example-sense-central"
}

variable "instance_type" {
  description = "AWS EC2 type"
  type        = string
  default     = "t3.large"
}

variable "subnet_id" {
  description = "AWS Subnet ID"
  type        = string
  default     = "subnet-06c309b2a13051e40"
}

variable "iam_policy_name" {
  description = ""
  type        = string
  default     = ""
}

variable "key_name" {
  description = "AWS key pair name"
  type        = string
  default     = "example-Sense-Central-Node-Key"
}

variable "cidr_blocks" {
  description = "network range"
  type        = string
  default     = "172.31.0.0/16"
}

variable "ec2_role" {
  description = "AWS Role"
  type        = string
  default     = "test-example-tf-role"
}

variable "ec2_security_group_id" {
  description = "Security Group"
  type        = list(string)
  default     = ["sg-0da81d0098a4ecc62"]
}