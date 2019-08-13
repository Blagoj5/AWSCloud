#EC2 instances
resource "aws_instance" "WebServer01" {
  ami           = "ami-0cfee17793b08a293"
  instance_type = "t2.micro"
  key_name = "${aws_key_pair.mykey.key_name}"
  vpc_security_group_ids = ["${aws_security_group.SecurityGroupForPublic.id}"]
  subnet_id = "${var.PUBLIC_SUBNET}"
  user_data = "${data.template_cloudinit_config.shell-script.rendered}"
  
  tags = {
    Name = "WebServer01PUBLIC"
  }
}

resource "aws_instance" "WebServer02" {
  ami           = "ami-0cfee17793b08a293"
  instance_type = "t2.micro"
  key_name = "${aws_key_pair.mykey.key_name}"
  vpc_security_group_ids = ["${aws_security_group.SecurityGroupForPrivate.id}"]
  subnet_id = "${var.PRIVATE_SUBNET}"
  
  tags = {
    Name = "WebServer02PRIVATE"
  }
}

#KEY
resource "aws_key_pair" "mykey" {
  key_name = "mykey"
  public_key = "${file("${var.PATH_TO_PUB_KEY}")}"
} 

#USER-DATA, init script on START
data "template_file" "script" {
  template = "${file("scripts/httpd.sh")}"
  vars = {
    # Variables = "${aws_instance.WebServer01.public_ip}" #vars inside the template
    Variables = "${var.TEST}" #vars inside the template

  }
}

data "template_cloudinit_config" "shell-script" {
  gzip          = false
  base64_encode = false

 # Adding the start-up scripth
  part {
    content_type = "text/x-shellscript"
    content      = "${data.template_file.script.rendered}"  
  }
}
