resource "aws_eip" "elastic-ip" {
  vpc = true
  instance                  = "${var.instance_id}"
}