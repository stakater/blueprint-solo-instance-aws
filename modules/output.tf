output "security_group_id" {
  value = "${module.solo-instance.security_group_id}"
}

output "instance-id" {
  value = "${module.solo-instnace.instance-id}"
}

output "private-ip" {
  value = "${module.solo-instnace.private-ip}"
}

# Public Elastic IP
output "public-ip" {
  value = "${module.elastic-ip.ip}"
}