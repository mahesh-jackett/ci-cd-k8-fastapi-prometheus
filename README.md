# ML-Ops Practice
1. Github `Ci-CD` working fine with `EC2`

# Usage:
# _____
1. For `K8 - Kubernetes` hit at `http://192.168.49.2:30000`
2. For simple `Docker` and without container simply use the `localhost:8000`


# Some Helpful Info & Tips:
1. [Tag Docker images before pushing](https://stackoverflow.com/questions/41984399/denied-requested-access-to-the-resource-is-denied-docker)
2. `kubectl get deployment fastapi-app-deployment -o yaml > fastapi-etcd-cluster-status.yaml` Gives you the status of cluster for the Deployment (which has replicas or pods) named `fastapi-app-deployment` in a file named `fastapi-etcd-cluster-status.yaml` where you can cross check your `deployment.yaml` and `service.yaml` to know how the clusters are managed according to the specifications (`spec` field in files). This info is stored in `etcd` which supervises all the failures and auto creation of pods cross checking with this file
3. Create and apply the `ConfigMap` and `Secrets` files first and then apply the Service and Deployment else it'll result in the error if any of the service uses those secrets and configurations
4. If there is a `Service` running inside cluster, it is allocated **INTERNAL IP ADDRESS** so the system knows that at which particular address the service is running. So in case we want to access the data from that service, we use **THAT** internal address to communicate. So in other terms, How and where to connect with an app is defined in it's `service.yaml` file and whenever we want to know the address like `MongoDB` url, we refer to that service instead of static url.
