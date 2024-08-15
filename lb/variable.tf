variable "sg_for_lb" {
  description = "Security group for Load balancer"
  type        = list(string)
}

variable "subnet_ids" {
    description = "Subnet id for Load balancer"
    type = list(string)  
}

variable "vpc_id" {  
}

variable "s3_website_endpoint" {
  
}