output "ip" {
  value = "${aws_eip.elastic-ip.public_ip}"
}

output "private-ip" {
  value = "${aws_eip.elastic-ip.private_ip}"
}

output "instance-id" {
  value = "${aws_eip.elastic-ip.instance}"
}