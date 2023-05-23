#!/bin/bash

set -e # Stop on error

# kubectl delete all --all # Delete all the pods and services running

# Remove the Docker images
docker rmi fastapi-image-test-k8 || true # || true means if error comes, skip onto next process
docker rmi maheshjackett/fastapi-image-test-k8 || true

# Delete all the Kubernetes deployments  and service
kubectl delete deployment fastapi-app-deployment || true
kubectl delete deployment mongo-express || true
kubectl delete deployment mongodb-deployment || true

# # Delete the Mongo Express Services
kubectl delete services fastapi-app-service || true
kubectl delete services mongo-express-service || true
kubectl delete services mongodb-service || true

# Build the Docker image
docker build --no-cache -t fastapi-image-test-k8 .

# Tag and push the Docker image
docker tag fastapi-image-test-k8 maheshjackett/fastapi-image-test-k8
docker push maheshjackett/fastapi-image-test-k8

# Apply all the files in stepwise manner
kubectl apply -f ./k8_configs/mongo_secrets.yaml # secrets
kubectl apply -f ./k8_configs/mongo_configmap.yaml # Configs
kubectl apply -f ./k8_configs/mongo_depl_serv.yaml # DB should be run first. One files has deployment and service
kubectl apply -f ./k8_configs/mongo_express.yaml # One file for both deployment and service
kubectl apply -f ./k8_configs/fastapi_deployment_file.yaml # FastAPI Deployment pod
kubectl apply -f ./k8_configs/fastapi_service_file.yaml # FastAPI service
kubectl apply -f ./k8_configs/ingress.yaml # Enable ingress for routing