provider "aws" {
  region = "${var.region}"
}

module "network" {
  source             = "./modules/network"
  vpc_cidr           = "${var.vpc_cidr}"
  environment        = "${var.environment}"
  public_cidr        = "${var.public_cidr}"
  private_cidr       = "${var.private_cidr}"
  availibility_zones = "${var.availibility_zones}"
}










variable "region" {}

variable "vpc_cidr" {}

variable "environment" {}

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
