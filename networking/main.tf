# vpc creation

resource "aws_vpc" "vpc_test" {
  cidr_block = var.cidr_range
  instance_tenancy = var.instance_tenancy
  tags = {
    Name = var.vpc_name
  }
}

# subnet creation

# creation of public subnet01

resource "aws_subnet" "public01" {
  vpc_id     = var.vpc_id
  cidr_block = var.subnet1cidr
  availability_zone = var.availability_zone_01

  tags = {
    Name = var.subnet_01
  }
  
}

# creation of public subnet02

resource "aws_subnet" "public02" {
vpc_id     = var.vpc_id
  cidr_block = var.subnet2cidr
  availability_zone = var.availability_zone_02

  tags = {
    Name = var.subnet_02
  }
  
}

# creation of private subnet01

resource "aws_subnet" "private01" {
vpc_id     = var.vpc_id
  cidr_block = var.subnet3cidr
  availability_zone = var.availability_zone_01

  tags = {
    Name = var.subnet_03
  }
  
}

# creation of private subnet02

resource "aws_subnet" "private02" {
vpc_id     = var.vpc_id
  cidr_block = var.subnet4cidr
  availability_zone = var.availability_zone_02

  tags = {
    Name = var.subnet_04
  }
  
}


# creation of internet gateway

resource "aws_internet_gateway" "internet_gateway" {
  vpc_id = var.vpc_id
  tags = {
    Name = var.internet_gateway_name
  }
}

# Elastic Ip creation

resource "aws_eip" "elastic_ip" {
  
  tags = {
    Name = var.elastic_ip_name
  }
}

# creation NAT GW
resource "aws_nat_gateway" "Nat_gate01" {
connectivity_type = var.connection_type
subnet_id         = var.public01_id
allocation_id = var.eip_id

tags = {
    Name = var.name_nat
  }
  
}

# creation of route table

#creation of public RT
resource "aws_route_table" "Route01" {
  vpc_id = var.vpc_id
  route  {
  cidr_block = var.nat_cidr_range
  gateway_id = var.IG_id
 }
 
  tags = {
    Name = var.rt01_name
  }
}

# creation of private RT
resource "aws_route_table" "Route02" {
  vpc_id = var.vpc_id
  route  {
  cidr_block = var.nat_cidr_range
  gateway_id = var.NAT_id
 }
 
  tags = {
    Name = var.rt02_name
  }
}

# subnet association

# public subnet-01 association
resource "aws_route_table_association" "public_subnet01_association" {
  subnet_id      = var.public01_id 
  route_table_id = var.RT01_id
}

# public subnet-02 association

resource "aws_route_table_association" "public_subnet02_association" {
  subnet_id      = var.public02_id
  route_table_id = var.RT01_id
}

# private subnet-01 association

resource "aws_route_table_association" "private_subnet01_association" {
  subnet_id      = var.private01_id
  route_table_id = var.RT02_id
}

# private subnet-02 association

resource "aws_route_table_association" "private_subnet02_association" {
  subnet_id      = var.private02_id
  route_table_id = var.RT02_id
}


# security grp creation

# security group for public
resource "aws_security_group" "SG_01" {
  
  vpc_id      = var.vpc_id
  ingress  {
    from_port   = var.ssh_port
    to_port     = var.ssh_port
    protocol    = var.protocol_tcp
    cidr_blocks = [var.sg_cidr_range]
  }
  egress  {
    from_port   = var.allow_port
    to_port     = var.allow_port
    protocol    = var.protocol_01
    cidr_blocks = [var.sg_cidr_range]
  }

  tags = {
    Name = var.public_sg01_name
  }
}

# security group for private
resource "aws_security_group" "SG_02" {
  
  vpc_id      = var.vpc_id
  ingress  {
    from_port   = var.grafana_port
    to_port     = var.grafana_port
    protocol    = var.protocol_tcp
    cidr_blocks = [var.sg_cidr_range]
  }
  egress  {
    from_port   = var.allow_port
    to_port     = var.allow_port
    protocol    = var.protocol_01
    cidr_blocks = [var.sg_cidr_range]
  }
  ingress  {
    from_port   = var.prometheus_port
    to_port     = var.prometheus_port
    protocol    = var.protocol_tcp
    cidr_blocks = [var.sg_cidr_range]
  }
  egress  {
    from_port   = var.allow_port
    to_port     = var.allow_port
    protocol    = var.protocol_01
    cidr_blocks = [var.sg_cidr_range]
  }

   ingress  {
    from_port   = var.exporter_port
    to_port     = var.exporter_port
    protocol    = var.protocol_tcp
    cidr_blocks = [var.sg_cidr_range]
  }
  egress  {
    from_port   = var.allow_port
    to_port     = var.allow_port
    protocol    = var.protocol_01
    cidr_blocks = [var.sg_cidr_range]
  }
  ingress  {
    from_port   = var.ssh_port
    to_port     = var.ssh_port
    protocol    = var.protocol_tcp
    cidr_blocks = [var.sg_cidr_range]
  }
  egress  {
    from_port   = var.allow_port
    to_port     = var.allow_port
    protocol    = var.protocol_01
    cidr_blocks = [var.sg_cidr_range]
  }

  ingress  {
    from_port   = var.HTTP_port
    to_port     = var.HTTP_port
    protocol    = var.protocol_tcp
    cidr_blocks = [var.sg_cidr_range]
  }
  egress  {
    from_port   = var.allow_port
    to_port     = var.allow_port
    protocol    = var.protocol_01
    cidr_blocks = [var.sg_cidr_range]
  }

  tags = {
    Name = var.private_sg02_name
  }
}
