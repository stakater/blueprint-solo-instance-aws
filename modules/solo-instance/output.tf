output "security_group_id" {
  value = "${aws_security_group.instance-security-group.id}"
}

output "instance-id" {
  value = "${coalesce(aws_instance.solo-instance.id, aws_instance.solo-instance-ebs.id)}"
}

output "private-ip" {
  value = "${coalesce(aws_instance.solo-instnace.private_ip, aws_instance.solo-instance-ebs.private_ip)}"
}
