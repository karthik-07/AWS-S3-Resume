output "sg_ec2_http_id" {
  value = aws_security_group.vpc_ec2_allow_access.id
}

output "sg_ec2_ssh_id" {
  value = aws_vpc_security_group_ingress_rule.allow_ssh_ipv4.id
}

output "sg_ec2_http_8080" {
  value = aws_vpc_security_group_ingress_rule.allow_jenkins_access.id
}