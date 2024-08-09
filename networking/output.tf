output "project_vpc_us_id" {
  value = aws_vpc.project_vpc_us.id
}

output "project_vpc_subnet_public_subnets" {
  value = aws_subnet.project_vpc_subnet_public.*.id
}