resource "aws_security_group" "SecurityGroupForPublic" {
  name        = "SecurityGroupForPublic"
  description = "Allow SSH inbound traffic and everything for PublicEC2"
  vpc_id      = "${aws_vpc.TerraformVPC.id}"

  ingress {
    # TLS (change to whatever ports you need)
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    # Please restrict your ingress to only necessary IPs and ports.
    # Opening to 0.0.0.0/0 can lead to security vulnerabilities.
    cidr_blocks = ["77.28.24.210/32"]
  }

  ingress {
    # TLS (change to whatever ports you need)
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    # Please restrict your ingress to only necessary IPs and ports.
    # Opening to 0.0.0.0/0 can lead to security vulnerabilities.
    cidr_blocks = ["77.28.24.210/32"]
  }

  ingress {
    # TLS (change to whatever ports you need)
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    # Please restrict your ingress to only necessary IPs and ports.
    # Opening to 0.0.0.0/0 can lead to security vulnerabilities.
    cidr_blocks = ["77.28.24.210/32"]
  }

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "SecurityGroupForPrivate" {
  name        = "SecurityGroupForPrivate"
  description = "Allow SSH inbound from The Public EC2"
  vpc_id      = "${aws_vpc.TerraformVPC.id}"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    # cidr_blocks = ["10.0.1.0/24"]
    
    # YOU CAN ALSO SPECIFY SECURITY GROUP INSTEAD OF THE WHOLE SUBNET (if u want only-
    # certain instances to have premission to the SG, instead of the whole subnet)
    security_groups = ["${aws_security_group.SecurityGroupForPublic}"]
    
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["10.0.1.0/24"]
  }

ingress {
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = ["10.0.1.0/24"]
  }

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }
}