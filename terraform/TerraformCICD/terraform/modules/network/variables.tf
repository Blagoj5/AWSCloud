variable "vpc_cidr" {
description = "VPC CIDR BLOCK (10.0.0.0/16 in the default vars file)"
}

variable "environment" {
description = "The name of the environment"  
}

variable "public_cidr" {
  type        = "list"
  description = "Cidr Block of public subnets (private or publix ex 10.0.1.0/24, or 10.0.2.0/24)"
}

variable "private_cidr" {
  type        = "list"
  description = "Cidr Block of private subnets (private or publix ex 10.0.1.0/24, or 10.0.2.0/24)"
}

variable "availibility_zones" {
  type        = "list"
  description = "List of azs you want. ex. us-east-1a us-east-1b"
}

variable "destination_cidr_block" {
  default     = "0.0.0.0/0"
  description = "Specify all traffic to be routed either trough Internet Gateway or NAT to access the internet"
}