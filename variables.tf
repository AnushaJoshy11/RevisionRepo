variable "vpc_id" {
  description = "ID of the VPC where to create security group"
  type        = string
  default     = null
}

variable "subnet_id" {
  description = "ID of the VPC where to create security group"
  type        = string
  default     = null
}

variable "security_group_ids" {
  description = "Enter the Security Group IDs"
  type        = list(any)
  default     = null
}


variable "ec2_name" {
  description = "Name of your EC2 Instance "
  type        = string
  default     = null
}

variable "availability_zone" {
  description = "Details of Availability Zone"
  type        = string
  default     = null
}