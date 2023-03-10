module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  version         = "~> 19.0"
  cluster_name    = local.cluster_name
  cluster_version = "1.24"
  subnet_ids         = module.vpc.private_subnets

  vpc_id = module.vpc.vpc_id

  eks_managed_node_groups = {
    blue = {}
    green = {
      min_size     = 1
      max_size     = 10
      desired_size = var.instance_count

      instance_types = ["t2.medium"]
      capacity_type  = "ON_DEMAND"
    }
  }


}

data "aws_eks_cluster" "cluster" {
  name = module.eks.cluster_id
}