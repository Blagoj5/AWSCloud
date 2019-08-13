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
