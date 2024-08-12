output "ec2_public_ip_address" {
  description = "The public IP address of the EC2 instance"
  value       = aws_instance.jenkins_ec2_instance.public_ip
}

output "ec2_private_ip_address" {
  description = "The private IP address of the EC2 instance"
  value       = aws_instance.jenkins_ec2_instance.private_ip
}

output "ec2_instance_id" {
  description = "The ID of the EC2 instance"
  value       = aws_instance.jenkins_ec2_instance.id
}