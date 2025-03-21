

data "aws_availability_zones" "available" {
  state = "available"
}


module "vpc" {
  source = "terraform-aws-modules/vpc/aws"
  version = "5.4.0"

  #vpc basic detail
  name ="${local.name}-${var.vpc_name}"
  cidr = var.vpc_cidr_block
  azs = data.aws_availability_zones.available.names

  public_subnets = var.vpc_public_subnets
  private_subnets =var.vpc_private_subnets

  #database subnets
  database_subnets = var.vpc_database_subnets
  create_database_subnet_group = var.vpc_create_database_subnet_group
  create_database_subnet_route_table = var.vpc_create_database_subnet_route_table

  #nat gateway - outbound communication
  enable_nat_gateway = var.vpc_enable_nat_gateway
  single_nat_gateway = var.vpc_single_nat_gateway

  enable_dns_hostnames = true
  enable_dns_support = true

  tags = local.common_tags
  vpc_tags = local.common_tags

  #additional tag to subnets
  public_subnet_tags = {
    Type = "public subnets"
  }

  private_subnet_tags = {
    Type = "private subnets"
  }

  database_subnet_tags = {
    Type = "private database subnets"
  }

}