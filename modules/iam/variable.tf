variable "name" {
  type = "string"
}

variable "iam_assume_role_policy" {
  type = "string"
  description = "Assume role policy for IAM role"
}

variable "iam_role_policy" {
  type = "string"
  description = "AWS IAM role policy"
}