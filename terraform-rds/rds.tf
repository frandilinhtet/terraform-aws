resource "aws_db_subnet_group" "db_subnet_gp" {
  name       = var.db_subnet_name
  subnet_ids = aws_subnet.private_subnets[*].id

  tags = merge(local.common_tags, {
    Name = "${var.db_subnet_name}"
  })
}

resource "aws_db_instance" "demo_rds" {
  identifier     = var.name
  db_name        = var.name
  engine         = var.db_engine
  engine_version = var.db_engine_version
  instance_class = var.class

  username = var.user
  password = var.pass

  storage_encrypted = var.encrypt
  storage_type      = var.type
  allocated_storage = var.storage

  db_subnet_group_name      = aws_db_subnet_group.db_subnet_gp.name
  vpc_security_group_ids    = [aws_security_group.rds_sec_gp.id]
  multi_az                  = var.multi
  publicly_accessible       = var.public
  skip_final_snapshot       = var.skip
  final_snapshot_identifier = var.final

  tags = merge(local.common_tags, {
    Name = "${var.name}"
  })
}


