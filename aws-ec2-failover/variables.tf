variable "image_id" {
  description = "Image ID used on EC2"
  type        = string
  default     = "ami-0000w0000"
}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
  default     = "vpc-0000w0000"
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
  default     = "example-app-failover"
}

variable "instance_type" {
  description = "AWS EC2 type"
  type        = string
  default     = "t3.large"
}

variable "subnet_id" {
  description = "AWS Subnet ID"
  type        = string
  default     = "subnet-0000w0000"
}

variable "iam_policy_name" {
  description = ""
  type        = string
  default     = ""
}

variable "key_name" {
  description = "AWS key pair name"
  type        = string
  default     = "example-app-Failover-Node-Key"
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
   default     = ["sg-0000w0000"]
 }