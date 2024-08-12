output "ec2_public_ip_address" {
  description = "The public IP address of the EC2 instance"
  value       = length(aws_instance.jenkins_ec2_instance) > 0 ? aws_instance.jenkins_ec2_instance[0].public_ip : null
}

output "ec2_private_ip_address" {
  description = "The private IP address of the EC2 instance"
  value       = length(aws_instance.jenkins_ec2_instance) > 0 ? aws_instance.jenkins_ec2_instance[0].private_ip : null
}

output "ec2_instance_id" {
  description = "The ID of the EC2 instance"
  value       = length(aws_instance.jenkins_ec2_instance) > 0 ? aws_instance.jenkins_ec2_instance[0].id : null
}