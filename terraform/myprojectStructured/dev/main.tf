provider "aws" {
    region = "${var.AWS_REGION}"
}

module "EC2_module" {
  source = "../modules/EC2"
  VPC_ID = "${module.VPC_module.vpc_id}"
  PUBLIC_SUBNET = "${module.VPC_module.vpc_public_subnet_id}"
  PRIVATE_SUBNET = "${module.VPC_module.vpc_private_subnet_id}" 
  PATH_TO_PUB_KEY = "${var.PrivateKeyPath}"
}


module "VPC_module" {
  source = "../modules/VPC"
  
}
