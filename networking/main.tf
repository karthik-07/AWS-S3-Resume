

resource "aws_vpc" "project_vpc_us" {
  cidr_block = var.vpc_cidr
  tags = {
    Name = var.vpc_name
  }
}

resource "aws_subnet" "project_vpc_subnet_public" {
  count      = length(var.vpc_public_subnet)
  vpc_id     = aws_vpc.project_vpc_us.id
  cidr_block = element(var.vpc_public_subnet, count.index)

  tags = {
    Name = "project-vpc-public-subnet-${count.index + 1}"
  }
}

resource "aws_subnet" "project_vpc_subnet_private" {
  count      = length(var.vpc_private_subnet)
  vpc_id     = aws_vpc.project_vpc_us.id
  cidr_block = element(var.vpc_private_subnet, count.index)

  tags = {
    Name = "project-vpc-private-subnet-${count.index + 1}"
  }
}

resource "aws_internet_gateway" "project_vpc_internet_gateway" {
  vpc_id = aws_vpc.project_vpc_us.id
  tags = {
    Name = "project_vpc_igw"
  }
}

resource "aws_route_table" "project_vpc_public_route_table" {
  vpc_id = aws_vpc.project_vpc_us.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.project_vpc_internet_gateway.id
  }

  tags = {
    Name = "project_vpc_public_route_table"
  }
}

resource "aws_route_table_association" "project_vpc_public_route_table_association" {
  count          = length(aws_subnet.project_vpc_subnet_public)
  subnet_id      = aws_subnet.project_vpc_subnet_public[count.index].id
  route_table_id = aws_route_table.project_vpc_public_route_table.id
}

resource "aws_route_table" "project_vpc_private_route_table" {
  vpc_id = aws_vpc.project_vpc_us.id

  tags = {
    Name = "project_vpc_private_route_table"
  }
}

resource "aws_route_table_association" "project_vpc_private_route_table_association" {
  count          = length(aws_subnet.project_vpc_subnet_private)
  subnet_id      = aws_subnet.project_vpc_subnet_private[count.index].id
  route_table_id = aws_route_table.project_vpc_private_route_table.id
}