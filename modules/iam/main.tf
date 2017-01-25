## Creates IAM role
resource "aws_iam_role" "instance-role" {
  # Same name for instance profile and role, for ease while fetching data using AWS meta-data API
  name = "${var.name}"
  path = "/"

  lifecycle {
    create_before_destroy = true
  }

  assume_role_policy = "${var.iam_assume_role_policy}"
}

resource "aws_iam_instance_profile" "instance-profile" {
  # Same name for instance profile and role, for ease while fetching data using AWS meta-data API
  name  = "${var.name}"
  roles = ["${aws_iam_role.instance-role.name}"]

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_iam_role_policy" "instance-role-policy" {
  name = "${var.name}-role-policy"
  role = "${aws_iam_role.instance-role.id}"

  lifecycle {
    create_before_destroy = true
  }

  policy = "${var.iam_role_policy}"
}
