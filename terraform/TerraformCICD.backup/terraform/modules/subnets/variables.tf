variable "name" {
  description = "Name of the Subnet, actual name will be: ex. name_eu-west-1a"
}

variable "environment" {
  description = "The name of the env."
}

variable "cidrs" {
  type        = "list"
  description = "Cidr Block of subnets (private or publix ex 10.0.1.0/24, or 10.0.2.0/24)"
}

variable "availibility_zones" {
  type        = "list"
  description = "List of azs you want. ex. us-east-1a us-east-1b"
}

variable "vpc_id" {
  description = "The vpc id to attach the subnet to"
}
