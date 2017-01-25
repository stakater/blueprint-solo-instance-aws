resource "aws_eip" "elastic-ip" {
  vpc = true
  instance                  = "${var.instance_id}"
  associate_with_private_ip = "${var.instance_private_ip}"
}