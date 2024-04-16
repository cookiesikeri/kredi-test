# Setup an EKS or GKE cluster and RDS Database/Cloud SQL

this is a cicd github actions pipeline with helm chart that deploys app to EKS using argocd.

pipeline steps:

1. push the code to main branch to trigger the pipeline.
2. also i added trivy to scan the image before its sent to ECR
3. helmchart picks the latest image tag version while argo pulls 
4. which also  triggers ArgoCD to deploy Helm Chart in the Kubernetes




# configuration: 

terraform complete setup

terraform init
terraform validate
terraform fmt
terraform plan
terraform apply -auto-approve

# create argo cd:
use the application.yml in the rool directory to create argo.

command: kubectl apply -f application.yaml
