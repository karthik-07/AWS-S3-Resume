output "project_vpc_us_id" {
  value = aws_vpc.project_vpc_us.id
}

output "project_vpc_subnet_public_subnets_count" {
  value = length(aws_subnet.project_vpc_subnet_public)
}