# Boundary Getting Started
This will setup a EKS cluster, install backstage.io and use boundary to access it

# EKS
![eks](./consul-aws-eks-terraform/eks-cluster.tf)

Setting up an EKS cluster is a process that involves several steps. The first and most important step is to use Terraform to configure the necessary infrastructure. In this step we will create the EKS cluster itself. 
```bash
cd eks
terraform apply

```