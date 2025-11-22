resource "aws_key_pair" "bastion_key" {
  key_name   = "bastion-key"
  public_key = file("bastion-key.pub")
}

resource "aws_instance" "bastion" {
  ami           = var.image
  instance_type = var.instance
  subnet_id     = aws_subnet.public_subnets[0].id

  associate_public_ip_address = var.assocaite
  vpc_security_group_ids      = [aws_security_group.bastion_sec_gp.id]
  key_name                    = aws_key_pair.bastion_key.key_name

  tags = merge(local.common_tags, {
    Name = "${var.instance_name}"
  })
}