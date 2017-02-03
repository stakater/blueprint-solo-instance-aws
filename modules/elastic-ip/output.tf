output "ip" {
  value = "${aws_eip.elastic-ip.public_ip}"
}

# instance id
output "instance-id" {
  value = "${aws_eip.elastic-ip.instance}"
}