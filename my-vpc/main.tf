module "my_vpc" {
  source = "./common/"

  aws_region            = var.aws_region
  availability_zone     = var.availability_zone
  vpc_name              = var.vpc_name
  vpc_cidr              = var.vpc_cidr
  subnet_name           = var.subnet_name
  public_subnet_cidr    = var.public_subnet_cidr
  igw_name              = var.igw_name

}
