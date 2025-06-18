module "ec2" {
  source             = "../../modules/ec2"
  ami_id             = var.ami_id
  instance_type      = var.instance_type
  key_name           = var.key_name
  subnet_id          = var.public_subnet_id
  security_group_ids = var.security_group_ids
  associate_public_ip = true
  name               = "dev-ec2"
}

