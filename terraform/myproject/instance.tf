resource "aws_instance" "WebServer01" {
  ami           = "ami-0cfee17793b08a293"
  instance_type = "t2.micro"
  key_name = "${aws_key_pair.mykey.key_name}"
  vpc_security_group_ids = ["${aws_security_group.SecurityGroupForPublic.id}"]
  subnet_id = "${aws_subnet.public-subnet.id}"
  user_data = "${data.template_cloudinit_config.shell-script.rendered}"
  depends_on = ["aws_internet_gateway.gw"]
  
  tags = {
    Name = "WebServer01PUBLIC"
  }
}

resource "aws_instance" "WebServer02" {
  ami           = "ami-0cfee17793b08a293"
  instance_type = "t2.micro"
  key_name = "${aws_key_pair.mykey.key_name}"
  vpc_security_group_ids = ["${aws_security_group.SecurityGroupForPrivate.id}"]
  subnet_id = "${aws_subnet.private-subnet.id}"
  user_data = "${data.template_cloudinit_config.shell-script.rendered}"
  
  tags = {
    Name = "WebServer02PRIVATE"
  }
}
