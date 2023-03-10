# Boundary Getting Started
This will setup a EKS cluster, install backstage.io and use boundary to access it

# EKS
![eks](./consul-aws-eks-terraform/eks-cluster.tf)

To set up an EKS cluster, the first step is to use Terraform to configure the necessary infrastructure. This involves creating a VPC, subnets, and security groups.
```bash
cd eks
terraform init
```