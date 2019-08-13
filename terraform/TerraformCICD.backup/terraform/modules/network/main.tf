module "vpc" {
  source = "../vpc"

  vpc_cidr    = "${var.vpc_cidr}"
  environment = "${var.environment}"
  
}

module "public_subnets" {
  source             = "../subnets"
  name               = "${var.environment}_public-subnets"
  vpc_id             = "${module.vpc.id}"
  cidrs              = "${var.public_cidr}"
  availibility_zones = "${var.availibility_zones}"
  environment        = "${var.environment}"
}

module "private_subnets" {
  source             = "../subnets"
  name               = "${var.environment}_private-subnets"
  vpc_id             = "${module.vpc.id}"
  cidrs              = "${var.private_cidr}"
  availibility_zones = "${var.availibility_zones}"
  environment        = "${var.environment}"
}

resource "aws_route" "public_igw_route" {
  route_table_id            = "${module.public_subnets.route_table_id}"
  destination_cidr_block    = "${var.destination_cidr_block}"
  gateway_id                = "${module.vpc.igw}"
  depends_on                = ["module.public_subnets.route_table_id"]
}

#IF U WANT PRIVATE ROUTE, MAKE NAT GATEWAY