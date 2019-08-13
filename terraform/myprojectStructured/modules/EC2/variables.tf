
variable "VPC_ID" {}

variable "PUBLIC_SUBNET" {}

variable "PRIVATE_SUBNET" {}

variable "CIDR_BLOCK_ALLOWANCE" {
  default = ["77.28.0.0/16", "77.28.30.244/32"]
}

variable "PATH_TO_PUB_KEY" {
}

variable "TEST" {
  default = "TEstologija"
}
