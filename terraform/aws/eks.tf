

locals {
  # VPC - existing or new?
  vpc_id                      = var.vpc_id == "" ? module.vpc.vpc_id : var.vpc_id
  public_subnet_ids           = coalescelist(module.vpc.public_subnets, var.public_subnet_ids, [""])
  private_subnet_ids          = coalescelist(module.vpc.private_subnets, var.private_subnet_ids, [""])
  private_subnets_cidr_blocks = coalescelist(module.vpc.private_subnets_cidr_blocks, var.private_subnets_cidr_blocks, [""])
}

data "aws_region" "current" {}

###################
# VPC
###################

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "~> 3.0"

  create_vpc = var.vpc_id == ""

  name = var.name

  cidr            = var.cidr
  azs             = var.azs
  public_subnets  = var.public_subnets
  private_subnets = var.private_subnets

  enable_nat_gateway = true
  single_nat_gateway = true

}

###################
# Security groups
###################

module "eks_sg" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "~> 4.0"

  name        = "eks-sg"
  vpc_id      = local.vpc_id
  description = "Allow outbound connections to the world"

  ingress_cidr_blocks = ["0.0.0.0/0"]

  egress_rules = ["all-all"]

}

###################
# EKS
###################

module "eks" {
  source = "terraform-aws-modules/eks/aws"

  cluster_name                    = "cloudquery-eks"
  cluster_version                 = "1.21"
  cluster_endpoint_private_access = true
  cluster_endpoint_public_access  = true

  cluster_addons = {
    coredns = {
      resolve_conflicts = "OVERWRITE"
    }
    kube-proxy = {}
    vpc-cni = {
      resolve_conflicts = "OVERWRITE"
    }
  }


  vpc_id     = local.vpc_id
  subnet_ids = local.private_subnet_ids

  // # EKS Managed Node Group(s)
  eks_managed_node_group_defaults = {
    ami_type               = "AL2_x86_64"
    disk_size              = 100
    instance_types         = ["m5.large"]
    vpc_security_group_ids = [module.eks_sg.security_group_id]
  }

  eks_managed_node_groups = {
    # Default node group - as provided by AWS EKS
    default_node_group = {
      # By default, the module creates a launch template to ensure tags are propagated to instances, etc.,
      # so we need to disable it to use the default template provided by the AWS EKS managed node group service
      create_launch_template = false
      launch_template_name   = ""
      max_size     = 2
      desired_size = 1
    }
  }

}