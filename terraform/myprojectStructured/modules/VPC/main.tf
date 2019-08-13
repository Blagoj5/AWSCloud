resource "aws_vpc" "TerraformVPC" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"
  enable_dns_hostnames = "true"

  tags = {
    Name = "main"
  }
}

#SUBNETS
resource "aws_subnet" "public-subnet" {
  vpc_id     = "${aws_vpc.TerraformVPC.id}"
  cidr_block = "${var.Public-subnet-ip-range[0]}"
  availability_zone = "us-east-1a"
  map_public_ip_on_launch = "true"
  
  tags = {
    Name = "PublicSubnet"
  }
}

resource "aws_subnet" "private-subnet" {
  vpc_id     = "${aws_vpc.TerraformVPC.id}"
  cidr_block = "${var.Private-subnet-ip-range[0]}"
  availability_zone = "us-east-1b"
  map_public_ip_on_launch = "false"
  tags = {
    Name = "PrivateSubnet"
  }
}

#Internet gateway/VPC endpoint
resource "aws_internet_gateway" "gw" {
  vpc_id = "${aws_vpc.TerraformVPC.id}"
  tags = {
     Name = "MyPersonalGW"
  }
}

#Routing tables
resource "aws_route_table" "PublicRouteTable" {
  vpc_id = "${aws_vpc.TerraformVPC.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.gw.id}"
  }

  tags = {
    Name = "PublicRouteTable"
  }
}
resource "aws_route_table" "PrivateRouteTable" {
  vpc_id = "${aws_vpc.TerraformVPC.id}"

  tags = {
    Name = "PrivateRoutetable"
  }
}

resource "aws_route_table_association" "a" {
  subnet_id      = "${aws_subnet.public-subnet.id}"
  route_table_id = "${aws_route_table.PublicRouteTable.id}"
}
resource "aws_route_table_association" "b" {
  subnet_id      = "${aws_subnet.private-subnet.id}"
  route_table_id = "${aws_route_table.PrivateRouteTable.id}"
}