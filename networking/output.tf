# vpc id ouput
output "vpc_id" {
  value = aws_vpc.vpc_test.id
}

# subnet output

output "public01_id" {
  value = aws_subnet.public01.id
}

output "public02_id" {
  value = aws_subnet.public02.id
}

output "private01_id" {
  value = aws_subnet.private01.id
}

output "private02_id" {
  value = aws_subnet.private02.id
}


# Internet gateway output

output "IG_id" {
  value = aws_internet_gateway.internet_gateway.id
}

# elastic ip output

output "eip_id" {
  value = aws_eip.elastic_ip.id
}

# NAT GW output

output "NAT_id" {
  value = aws_nat_gateway.Nat_gate01.id
}

# route table output

output "RT01_id" {
  value = aws_route_table.Route01.id
}

output "RT02_id" {
  value = aws_route_table.Route02.id
}

# sg output

output "sg01_id" {
  value = aws_security_group.SG_01.id
}

output "sg02_id" {
  value = aws_security_group.SG_02.id
}
