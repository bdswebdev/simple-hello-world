
App:
docker build . -t node-test-app:latest 
docker tag node-test-app:latest bdswebdev/node-test-app:latest


create project in gce

enable Compute Engine API (terraform will remind you if you forget)

gcloud services enable compute.googleapis.com
OR
https://console.cloud.google.com/apis/library/compute.googleapis.com?project=<project id>


gcloud services enable container.googleapis.com

terraform init

update terraform.tfvars in terraform
you can override the region with
region     = "europe-west6"

terraform apply -var="first_run=true"   - hacky solution to fit into quota
following runs should be 
terraform apply



david@DESKTOP-1:~/projects/saas.group/learn-terraform-provision-gke-cluster-main$ gcloud container clusters get-credentials $(terraform output -raw kubernetes_cluster_name) --region $(terraform output -raw region)
Fetching cluster endpoint and auth data.
CRITICAL: ACTION REQUIRED: gke-gcloud-auth-plugin, which is needed for continued use of kubectl, was not found or is not executable. Install gke-gcloud-auth-plugin for use with kubectl by following https://cloud.google.com/blog/products/containers-kubernetes/kubectl-auth-changes-in-gke
kubeconfig entry generated for steam-crowbar-385609-gke.
david@DESKTOP-1:~/projects/saas.group/learn-terraform-provision-gke-cluster-main$


sudo apt-get install google-cloud-sdk-gke-gcloud-auth-plugin



gcloud container clusters get-credentials $(terraform output -raw kubernetes_cluster_name) --region $(terraform output -raw region)