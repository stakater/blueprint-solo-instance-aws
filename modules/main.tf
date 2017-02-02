module "iam" {
  source                 = "./iam"
  name                   = "${var.name}-iam"
  iam_assume_role_policy = "${var.iam_assume_role_policy}"
  iam_role_policy        = "${var.iam_role_policy}"
}

module "solo-instance" {
  source                      = "./solo-instance"
  name                        = "${var.name}"
  subnet_id                   = "${var.subnet_id}"
  ami                         = "${var.ami}"
  instance_type               = "${var.instance_type}"
  key_name                    = "${var.key_name}"
  associate_public_ip_address = "${var.associate_public_ip_address}"
  user_data                   = "${var.user_data}"
  instance-profile-name       = "${module.iam.instance-profile-name}"
  ebs_optimized               = "${var.ebs_optimized}"
  # Root EBS Volume
  root_vol_type               = "${var.root_vol_type}"
  root_vol_del_on_term        = "${var.root_vol_del_on_term}"
  root_vol_size               = "${var.root_vol_size}"
  # Data EBS Volume
  data_ebs_vol_type           = "${var.data_ebs_vol_type}"
  data_ebs_vol_size           = "${var.data_ebs_vol_size}"
  data_ebs_device_name        = "${var.data_ebs_device_name}"
  data_ebs_snapshot_id        = "${var.data_ebs_snapshot_id}"
  data_ebs_vol_del_on_term    = "${var.data_ebs_vol_del_on_term}"
  # Logs EBS Volume
  logs_ebs_vol_type           = "${var.logs_ebs_vol_type}"
  logs_ebs_vol_size           = "${var.logs_ebs_vol_size}"
  logs_ebs_device_name        = "${var.logs_ebs_device_name}"
  logs_ebs_snapshot_id        = "${var.logs_ebs_snapshot_id}"
  logs_ebs_vol_del_on_term    = "${var.logs_ebs_vol_del_on_term}"
}

module "elastic-ip" {
  source              = "./elastic-ip"
  instance_id         = "${module.solo-instance.instance-id}"
  instance_private_ip = "${module.solo-instance.private-ip}"
}