resource "aws_security_group" "instance-security-group" {
  name_prefix = "${var.name}-sg-"
  description = "${var.name} security group"
  vpc_id      = "${var.vpc_id}"

  tags {
    Name        = "${var.name}-sg"
    managed_by  = "Stakater"
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_instance" "solo-instance" {
    # if ebs device name is not given or is empty,
    # this count will be 1 resulting in the creation of this resource
    count                       = "${signum(length(var.data_ebs_device_name)) + 1 % 2}"
    subnet_id                   = "${var.subnet_id}"
    ami                         = "${var.ami}"
    instance_type               = "${var.instance_type}"
    key_name                    = "${var.key_name}"
    vpc_security_group_ids      = ["${aws_security_group.instance-security-group.id}"]
    associate_public_ip_address = "${var.associate_public_ip_address}"
    user_data                   = "${var.user_data}"
    iam_instance_profile        = "${var.instance-profile-name}"
    ebs_optimized               = "${var.ebs_optimized}"

    root_block_device {
      volume_type           = "${var.root_vol_type}"
      delete_on_termination = "${var.root_vol_del_on_term}"
      volume_size           = "${var.root_vol_size}"
    }

    lifecycle {
      create_before_destroy = true
    }

    tags {
        Name = "${var.name}"
    }
}

resource "aws_instance" "solo-instance-ebs" {
    # if ebs device name is not empty, this count will be 1
    # resulting in the creation of this resource
    count                       = "${signum(length(var.data_ebs_device_name))}"
    subnet_id                   = "${var.subnet_id}"
    ami                         = "${var.ami}"
    instance_type               = "${var.instance_type}"
    key_name                    = "${var.key_name}"
    vpc_security_group_ids      = ["${aws_security_group.instance-security-group.id}"]
    associate_public_ip_address = "${var.associate_public_ip_address}"
    user_data                   = "${var.user_data}"
    iam_instance_profile        = "${var.instance-profile-name}"
    ebs_optimized               = "${var.ebs_optimized}"

    root_block_device {
      volume_type           = "${var.root_vol_type}"
      delete_on_termination = "${var.root_vol_del_on_term}"
      volume_size           = "${var.root_vol_size}"
    }

    # EBS Volume for Data
    ebs_block_device {
      volume_type           = "${var.data_ebs_vol_type}"
      volume_size           = "${var.data_ebs_vol_size}"
      device_name           = "${var.data_ebs_device_name}"
      snapshot_id           = "${var.data_ebs_snapshot_id}"
      delete_on_termination = "${var.data_ebs_vol_del_on_term}"
    }

    # EBS Volume for Logs
    ebs_block_device {
      volume_type           = "${var.logs_ebs_vol_type}"
      volume_size           = "${var.logs_ebs_vol_size}"
      device_name           = "${var.logs_ebs_device_name}"
      snapshot_id           = "${var.logs_ebs_snapshot_id}"
      delete_on_termination = "${var.logs_ebs_vol_del_on_term}"
    }

    lifecycle {
      create_before_destroy = true
    }

    tags {
        Name = "${var.name}"
    }
}
