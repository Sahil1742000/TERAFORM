# vpc variable
variable "cidr_range" {
  type = string
  default = "10.0.0.0/17"
}

variable "instance_tenancy" {
  type = string
  default = "default"
}

variable "vpc_name" {
  type = string
  default = "Tool_vpc"
}

# subnet variable

variable "vpc_id" {
  type = string
}

variable "subnet1cidr" {
  type = string
  default = "10.0.1.0/24"
}

variable "subnet2cidr" {
  type = string
  default = "10.0.2.0/24"
}


variable "subnet3cidr" {
  type = string
  default = "10.0.3.0/24"
}

variable "subnet4cidr" {
  type = string
  default = "10.0.4.0/24"
}

variable "availability_zone_01" {
  type = string
  default = "us-west-1b"
}

variable "availability_zone_02" {
  type = string
  default = "us-west-1c"
}

variable "subnet_01" {
  type = string
  default = "public_01"
}

variable "subnet_02" {
  type = string
  default = "public_02"
}

variable "subnet_03" {
  type = string
  default = "private_01"
}

variable "subnet_04" {
  type = string
  default = "private_02"
}

# Internet Gateway variable

variable "internet_gateway_name" {
  type = string
  default = "internet-gateway"
}

# elastic ip variable

variable "elastic_ip_name" {
  type = string
  default = "elastic-ip"
}


# NAT GW Variable

variable "public01_id" {
  type = string
}

variable "eip_id" {
  type = string
}

variable "name_nat" {
  type = string
  default = "NAT01"
}

variable "connection_type" {
  type = string
  default = "public"
}

#route table variable

variable "IG_id" {
  type = string
}

variable "NAT_id" {
  type = string
}
variable "rt01_name" {
  type = string
  default = "public-RT"
}

variable "rt02_name" {
  type = string
  default = "private-RT"
}

variable "nat_cidr_range" {
  type = string
  default = "0.0.0.0/0"
}


# subnet assocation variable

variable "public02_id" {
  type = string
}

variable "RT01_id" {
  type = string
}

variable "RT02_id" {
  type = string
}

variable "private01_id" {
  type = string
}

variable "private02_id" {
  type = string
}


# Security group variable

variable "public_sg01_name" {
  type = string
  default = "public-sg"
}

variable "private_sg02_name" {
  type = string
  default = "private-sg"
}

variable "ssh_port" {
  type = string
  default = "22"
}

variable "protocol_tcp" {
   type = string
  default = "tcp"
}

variable "protocol_01" {
   type = string
  default = "-1"
}

variable "grafana_port" {
  type = string
  default = "3000"
}

variable "allow_port" {
  type = string
  default = "0"
}

variable "HTTP_port" {
  type = string
  default = "80"
}

variable "sg_cidr_range" {
  type = string
  default = "0.0.0.0/0"
}
variable "prometheus_port" {
  type = string
  default = "9090"
}

variable "exporter_port" {
  type = string
  default = "9100"
}
