resource "aws_network_acl" "ACLForPrivate" {
  vpc_id = "${aws_vpc.TerraformVPC.id}"
  subnet_ids = ["${aws_subnet.private-subnet.id}"]
  
  egress {
    protocol   = "tcp"
    rule_no    = 200
    action     = "allow"
    cidr_block = "${var.Public-subnet-ip-range[0]}"
    from_port  = 80
    to_port    = 80
  }

  egress {
    protocol   = "icmp"
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = -1
    to_port    = -1
  }

  egress {
    protocol   = "tcp"
    rule_no    = 300
    action     = "allow"
    cidr_block = "${var.Public-subnet-ip-range[0]}"
    from_port  = 22
    to_port    = 22
  }

  ingress {
    protocol   = "tcp"
    rule_no    = 100
    action     = "allow"
    cidr_block = "${var.Public-subnet-ip-range[0]}"
    from_port  = 80
    to_port    = 80
  }

  ingress {
    protocol   = "tcp"
    rule_no    = 200
    action     = "allow"
    cidr_block = "${var.Public-subnet-ip-range[0]}"
    from_port  = 22
    to_port    = 22
  }

ingress {
    protocol   = "icmp"
    rule_no    = 300
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = -1
    to_port    = -1
  }

  tags = {
    Name = "ACLForPrivate"
  }
}

resource "aws_network_acl" "ACLForPublic" {
  vpc_id = "${aws_vpc.TerraformVPC.id}"
  subnet_ids = ["${aws_subnet.public-subnet.id}"]
  
  egress {
    protocol   = "tcp"
    rule_no    = 200
    action     = "allow"
    cidr_block = "${var.Private-subnet-ip-range[0]}"
    from_port  = 22
    to_port    = 22
  } 

  egress {
    protocol   = "-1"
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }

  ingress {
    protocol   = "tcp"
    rule_no    = 100
    action     = "allow"
    cidr_block = "${var.CIDR_BLOCK_ALLOWANCE[0]}"
    from_port  = 80
    to_port    = 80
  }

  ingress {
    protocol   = "tcp"
    rule_no    = 200
    action     = "allow"
    cidr_block = "${var.CIDR_BLOCK_ALLOWANCE[0]}"
    from_port  = 22
    to_port    = 22
  }

  tags = {
    Name = "ACLForPublic"
  }
}