output "vpc_id" {
  value = aws_vpc.vpc.id
}

output "public_subnets_id" {
  value = aws_subnet.public_subnets[*].id
}

output "private_subnets_id" {
  value = aws_subnet.private_subnets[*].id
}

output "db_private_subnets_id" {
  value = aws_db_subnet_group.db_subnet_gp[*].id
}

output "db_name" {
  value = aws_db_instance.demo_rds.identifier
}

output "rds_endpoint" {
  value = aws_db_instance.demo_rds.address
}

output "bastion_public_ip" {
  value = aws_instance.bastion.public_ip
}