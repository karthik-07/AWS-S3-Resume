
resource "aws_security_group" "vpc_ec2_allow_access" {
  name        = "Allow access"
  description = "Allow ec2 to access"
  vpc_id      = var.vpc_id

  tags = {
    Name = "Allow access"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_ssh_ipv4" {
  security_group_id = aws_security_group.vpc_ec2_allow_access.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22

  tags = {
    Name = "Allow ssh access"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_http_ipv4" {
  security_group_id = aws_security_group.vpc_ec2_allow_access.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  to_port           = 80
  ip_protocol       = "tcp"

  tags = {
    Name = "Allow HTTP access"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_jenkins_access" {
  security_group_id = aws_security_group.vpc_ec2_allow_access.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 8080
  ip_protocol       = "tcp"
  to_port           = 8080

  tags = {
    Name = "Allow Jenkins access"
  }
}

resource "aws_vpc_security_group_egress_rule" "allow_ssh_ipv4_anywhere" {
  security_group_id = aws_security_group.vpc_ec2_allow_access.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"

  tags = {
    Name = "Allow outgoing traffic"
  }
}

# resource "aws_vpc_security_group_egress_rule" "allow_http_ipv4_anywhere" {
#   security_group_id = aws_security_group.vpc_ec2_allow_ssh.id
#   cidr_ipv4         = "0.0.0.0/0"
#   ip_protocol       = "-1"
# }