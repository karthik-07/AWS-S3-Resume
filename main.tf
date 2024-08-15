module "networking" {
  source             = "./networking"
  vpc_cidr           = var.vpc_cidr
  vpc_name           = var.vpc_name
  vpc_public_subnet  = var.vpc_public_subnet
  vpc_private_subnet = var.vpc_private_subnet
}

module "security_group" {
  source           = "./security-groups"
  vpc_id           = module.networking.project_vpc_us_id
  ec2_sg_name      = "SG for ec2 to enable SSH and HTTP"
  ec2_jenkins_name = "Allow port 8080 for jenkins"
}

module "ec2" {
  source                   = "./ec2"
  ami_id                   = data.aws_ami.aws_ec2_ami_latest.id
  tag_name                 = "Testing-env"
  instance_type            = "t2.micro"
  public_key               = var.public_key
  subnet_id                = tolist(module.networking.project_vpc_subnet_public_subnets)[0]
  sg_for_jenkins           = [module.security_group.sg_ec2_http_id]
  enable_public_ip_address = true
}

module "s3_bucket" {
  source      = "./s3"
  bucket_name = "terraform-state-bucket-karthik"
  tag_name_s3 = "terraform-state-bucket-karthik"
}
module "s3_static_bucket" {
  source             = "./static-s3"
  static_bucket_name = "static-file-bucket-karthik"
}

module "lb_instance" {
  source = "./lb"
  sg_for_lb = [module.security_group.sg_ec2_http_id]
  subnet_ids = module.networking.project_vpc_subnet_public_subnets
  vpc_id = module.networking.project_vpc_us_id
  ec2_instance_id = module.ec2.ec2_instance_id
  s3_website_endpoint = module.s3_static_bucket.s3_bucket_regional_domain_name
}

output "load_balancer_dns" {
  description = "The DNS name of the load balancer"
  value = module.lb_instance.lb_dns_name
}