output "ec2_public_ip_address" {
  value = aws_instance.jenkins_ec2_instance.public_ip
}