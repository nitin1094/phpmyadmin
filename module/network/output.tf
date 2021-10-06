
# Id of created Virtual Private Cloud (VPC)
output "vpc_id" {
    value = aws_vpc.vpc_network.id
}

output "vpc" {
    value = aws_vpc.vpc_network
}

output "subnet_id" {
  value       = aws_subnet.public_subnet[*].id
  description = "description"
}

output "subnet_public" {
  value       = aws_subnet.public_subnet[*].id
  description = "description"
}

output "subnet_private" {
  value       = aws_subnet.private_subnet[*].id
  description = "description"
}
