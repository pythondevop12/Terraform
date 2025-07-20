module "storage" {
  source          = "./modules/storage"
  bucket_name_val = "${terraform.workspace}-${var.bucket_name_val}"
}

module "vpc" {
  source       = "./modules/vpc"
  vpc_cidr_val = var.vpc_cidr_val

}

module "subnet" {
  source       = "./modules/subnets"
  vpc_cidr_Val = var.vpc_cidr_val
}

module "security" {
  source = "./modules/security"
  vpc_id = module.vpc.aws_vpc_id
}

module "network" {
    source = "./modules/network"
    private_subnet_ids =   module.subnet.private_subnet_arns
    public_subnet_ids = module.subnet.public_subnet_arns
    region = var.region
    cidr_internet_block_val = var.cidr_internet_block_val
    vpv_id_val = module.vpc.aws_vpc_id
}


module "iamrole" {
  source = "./modules/iamrole"
  s3_bucket_arn = module.storage.s3_bucket_arn
}

module "ec2" {
  source = "./modules/ec2"
  public_subnet_ids = module.subnet.public_subnet_ids
  ami_value = var.ami_value
  instance_type_val = var.instance_type_val
  security_group_id = module.security.security_group_id
  instance_profile_name = module.iamrole.instance_profile_name
}
