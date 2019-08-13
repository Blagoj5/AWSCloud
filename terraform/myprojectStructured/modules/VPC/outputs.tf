output "vpc_id" {
  value = "${aws_vpc.TerraformVPC.id}"
}

output "vpc_public_subnet_id" {
  value = "${aws_subnet.public-subnet.id}"
}

output "vpc_private_subnet_id" {
  value = "${aws_subnet.private-subnet.id}"
}

