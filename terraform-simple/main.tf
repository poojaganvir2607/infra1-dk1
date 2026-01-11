provider "aws" {
  region = var.region
}
module "ec2" {
  source = "./modules/ec2"
  ami_id = var.ami_id
  instance_type = var.instance_type
  availability_zone = var.availability_zone
  instance_name = var.instance_name
}

module "ebs" {
  source = "./modules/ebs"
  availability_zone = var.availability_zone
  ebs_size = var.ebs_size
  device_name = var.device_name
  instance_id = module.ec2.instance_id
  volume_name = var.volume_name
  
}
