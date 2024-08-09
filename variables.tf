variable "vpc_cidr" {
  type        = string
  description = "CIDR block for VPC"
}

variable "vpc_name" {
  type        = string
  description = "Project for terraform/jenkins"
}

variable "vpc_public_subnet" {
  type        = list(string)
  description = "Public Subnet for VPC"
}

variable "vpc_private_subnet" {
  type        = list(string)
  description = "Private Subnet for VPC"
}

variable "public_key" {
  type        = string
  description = "Public key for EC2 instance"
}
