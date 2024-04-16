# Setup an EKS or GKE cluster and RDS Database/Cloud SQL

this is a cicd github actions pipeline with helm chart that deploys app to EKS using argocd.

pipeline steps:

1. push the code to main branch to trigger the pipeline.
2. also i added trivy to scan the image before its sent to ECR
3. helmchart picks the latest image tag version while argo pulls 
4. which also  triggers ArgoCD to deploy Helm Chart in the Kubernetes
5. also the helm chart is  pushed to s3 bucket.
Note: The workflow triggers on push to the main branch when changes are made in the charts/ directory.
also make sure s3 has neccesary permission to accept actions.




# EKS configuration: 

from the root , run the followings;


    terraform init
    terraform validate
    terraform fmt
    terraform plan
    terraform apply -auto-approve

# results:
this creates;
1. eks cluster with node groups and one instane running in them , making it 2 active worker nodes.
2. VPC

# RDS Config:

 1. cd into rds folder
 2. run the followings;
 
        terraform init
        terraform validate
        terraform fmt
        terraform plan
        terraform apply -auto-approve
# create argo cd:
use the application.yml file in the root directory to create argoCD or you use the terminal using kubectl.

command: kubectl apply -f application.yaml

# deploy 
