variable "ami_id" {
  description = "The AMI to use for the EC2 instance"
  type        = string
}

variable "instance_type" {
  description = "The type of instance to start"
  type        = string
}

variable "subnet_id" {
  description = "The VPC Subnet ID to launch in"
  type        = string
}

variable "sg_for_jenkins" {
  description = "A list of security group IDs to associate with"
  type        = list(string)
}

variable "enable_public_ip_address" {
  description = "Associate a public IP address with an instance in a VPC"
  type        = bool
  default     = false
}

variable "tag_name" {
  description = "A tag to assign to the instance"
  type        = string
}

variable "public_key" {
  description = "The public key material"
  type        = string
}