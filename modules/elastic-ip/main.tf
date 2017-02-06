resource "aws_eip" "elastic-ip" {
  vpc      = true
  count    = "${signum(var.enable_eip)}" # if enable_eip is set to true, this wil result in 1 and create eip
  instance = "${var.instance_id}"
}