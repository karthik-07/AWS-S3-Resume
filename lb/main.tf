resource "aws_lb" "balancer_instance" {
    name = "balancing-load-ec2"
    internal = false
    load_balancer_type = "application"
    security_groups = var.sg_for_lb
    subnets = var.subnet_ids
}