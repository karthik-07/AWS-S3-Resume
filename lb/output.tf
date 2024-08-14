output "lb_dns_name" {
  description = "DNS Name for load balancer"
  value = aws_lb.balancer_instance.dns_name
}