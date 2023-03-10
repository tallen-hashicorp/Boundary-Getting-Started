# Boundary Getting Started
This will setup a EKS cluster, install backstage.io and use boundary to access it

# EKS
![eks](./consul-aws-eks-terraform/eks-cluster.tf)

Setting up an EKS cluster is a process that involves several steps. The first step is to use Terraform to configure the necessary infrastructure. In this step we will create the EKS cluster itself. 
```bash
cd eks
terraform apply
cd ..
```

Now we have created the cluster we need to connect to it.
```bash
export CLUSTER_NAME=$(aws eks --region eu-west-2 list-clusters | jq -r '.clusters[0]')
aws eks --region eu-west-2 update-kubeconfig --name $CLUSTER_NAME
```

# Vault
The next step is to install Vault on your Kubernetes cluster. This can be done using Helm, once Vault is installed, the next step is to configure it to work with your Postgres instance. 
```bash
helm install vault hashicorp/vault \
    --namespace vault \
    -f ./vault/values.yml \
```