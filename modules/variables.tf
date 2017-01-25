variable "name" {
  type = "string"
}

## VPC parameters
variable "vpc_id" {
  type = "string"
  description = "ID of the vpc to in which the security group is to be created."
}

variable "subnet_id" {
  type = "string"
  description = "ID of the subnet to launch the instance in."
}

# IAM parameters
variable "iam_assume_role_policy" {
  type = "string"
  description = "Assume role policy for IAM role"
}

variable "iam_role_policy" {
  type = "string"
  description = "AWS IAM role policy"
}

# Solo-instance params
variable "ami" {
  type        = "string"
  description = "Amazon Machine Image (AMI) to launch the instance with"
}

variable "instance_type" {
  type        = "string"
  description = "EC2 instance type of the instance"
}

variable "key_name" {
  type        = "string"
  description = "SSH key pair to associate with the instance."
}

variable "associate_public_ip_address" {
  type        = "string"
  description = "Flag for associating public IP addresses with the instance."
  default     = false
}

variable "user_data" {
  type        = "string"
  description = "Initialization data for the instance"
}

variable "instance-profile-name" {
  description = "Name of the instnace profile to associate with the instance"
}

# Root EBS
variable "root_vol_type" {
  type        = "string"
  description = "The type of volume. Valid values are 'standard' or 'gp2'."
  default     = "gp2"
}

variable "root_vol_size" {
  type        = "string"
  description = "The Size of the root volume"
  default     = "12"
}

variable "root_vol_del_on_term" {
  type        = "string"
  description = "Whether the volume should be destroyed on instance termination."
  default     = false
}

# Extra EBS variables (optional)
variable "ebs_optimized" {
  type        = "string"
  description = "Flag to enable EBS optimization."
  default     = false
}

variable "data_ebs_vol_type" {
  type        = "string"
  description = "The type of volume. Valid values are 'standard' or 'gp2'."
  default     = "gp2"
}

variable "data_ebs_vol_size" {
  type        = "string"
  description = "The Size of the ebs volume"
  default     = "12"
}

variable "data_ebs_device_name" {
  type        = "string"
  description = "The name of the device to mount."
  default     = "/dev/sdf"
}

variable "data_ebs_snapshot_id" {
  type        = "string"
  description = "The Snapshot ID to mount."
  default     = ""
}

variable "data_ebs_vol_del_on_term" {
  type        = "string"
  description = "Whether the volume should be destroyed on instance termination."
  default     = false
}

variable "logs_ebs_vol_type" {
  type        = "string"
  description = "The type of volume. Valid values are 'standard' or 'gp2'."
  default     = "gp2"
}

variable "logs_ebs_vol_size" {
  type        = "string"
  description = "The Size of the ebs volume"
  default     = "12"
}

variable "logs_ebs_device_name" {
  type        = "string"
  description = "The name of the device to mount."
  default     = "/dev/sdg"
}

variable "logs_ebs_snapshot_id" {
  type        = "string"
  description = "The Snapshot ID to mount."
  default     = ""
}

variable "logs_ebs_vol_del_on_term" {
  type        = "string"
  description = "Whether the volume should be destroyed on instance termination."
  default     = false
}