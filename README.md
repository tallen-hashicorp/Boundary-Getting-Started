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

**NOTE I had to add AmazonEKSServicePolicy to the cluster role as per [this](https://stackoverflow.com/questions/58988669/eks-cannot-create-persistent-volume) guide**

# Vault
The next step is to install Vault on your Kubernetes cluster. This can be done using Helm, once Vault is installed, the next step is to configure it to work with your Postgres instance. 
```bash
kubectl create namespace vault
helm install vault hashicorp/vault --namespace vault
```

Now lets configire vault, first lets setp the port forward to access the new vault
```bash
kubectl -n vault port-forward vault-0 8200:8200
```

**On a diffrent terminal** lets initialize the cluster then unseal it.
```bash
export VAULT_ADDR='http://127.0.0.1:8200'
vault operator init
vault operator unseal
```