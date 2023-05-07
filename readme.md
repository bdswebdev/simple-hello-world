
# Instructions

Steps to set up the project. I used Linux(Ubuntu), but most of them should be the same in other os and disto environments as well.


#### Requirements
- docker
- terraform
- gcloud
- kubectl (with a version that includes kustomize)

## App

I used Docker Hub to push the build image, you can find it at:
https://hub.docker.com/r/bdswebdev/node-test-app

```
docker build . -t node-test-app:latest 

# push to your own repo after login :
docker tag node-test-app:latest <user>/<image>:<tag>
docker push <user>/<image>:<tag> 
```

## Infrastructure

- Create a project in Google Compute Engine
- Set project id
    ```
    gcloud config set project [project-id]
    ```

- Enable Compute Engine API (terraform will remind you if you forget)
    ```
    gcloud services enable compute.googleapis.com
    ```
    OR
    https://console.cloud.google.com/apis/library/compute.googleapis.com?project=[project-id]

- Enable Kubernetes Engine API
    ```
    gcloud services enable container.googleapis.com
    ```
    OR
    https://console.cloud.google.com/apis/library/container.googleapis.com?project=[project-id]

- ```
    cd terraform
    terraform init
    ```
    Update terraform.tfvars in terraform (i.e. change region).
    ```
    terraform apply
    ```
## Kubernetes

- If you don't have the gke-gcloud-auth-plugin, you need to install it.
    https://cloud.google.com/blog/products/containers-kubernetes/kubectl-auth-changes-in-gke

- Update kubeconfig file from the terraform output:
    ```
    gcloud container clusters get-credentials $(terraform output -raw cluster_name) --region $(terraform output -raw region)
    ```

- Deploy the application and set up the sevice and ingress:
    ```
    cd ../k8s
    kubectl apply -k base
    ```

- Get the public ip and access the application:
    ```
    kubectl get service
    ```
    grab the EXTERNAL-IP of "node-service"  
    you should find the result at http://<EXTERNAL-IP>:8080
