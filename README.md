# Cyberspeed_Assesment
This Assesment should include Docker, Kubernets, Minikube/AWS.

## Build/Test App Image
1. Build the image
```bash
docker build -t app:1.0 .
```
2. Run container from the image
```bash
docker run --name app -p 80:8080 app:1.0
```
3. Delete the container
```bash
docker rm $(docker stop $(docker ps -a --filter ancestor=app:1.0 -q ))
```
4. Push the image to docker hub
```bash
docker login
docker tag app:1.0 <docker-hub-username>/app:1.0
docker push <docker-hub-username>/app:1.0
```

## Build/Test Kubernetes cluster using Minikube
1. Start Minikube
```bash
minikube start
```
2. Deploy the appplication and load balancer in development namespace
```bash
kubectl apply -f ./k8s/namespace.yaml
kubectl apply -f ./k8s/deployments/app-deployment.yaml
kubectl apply -f ./k8s/services/app-load-balancer.yaml
```
3. Check the cluster dashboard
```bash
minikube dashboard
```
4. Change kubernetes config to the development namespace
```bash
kubectl config set-context --current --namespace=development
```
5. Test the cluster by accessing the load balancer
```bash
minikube service app-service --namespace development
```
6. Check Application logs
```bash
kubectl get pods
kubectl logs <pod-name>
```

## Autoscaling
1. Enable metric-server on the cluster
```bash
minikube addons enable metrics-server
minikube addons list
```
2. Deploy the horizontal autoscaler
```bash
kubectl create -f ./k8s/autoscaler/app-hpa.yaml
```
3. Test the autoscaler
    1. Call the load balancer from any pod
    ```bash
    kubectl exec -it <pod-name> -- bash
    while true; do curl <cluster-ip-of-load-balancer>:8081 ; done
    ```
    2. Notice that the pods autoscale one by one every 15 seconds until reach to the maximum 5
    ```bash
    kubectl get pods
    ```
    3. Terminate the command that runs in step 2
    4. Notice that the first pod will scale down after 2 minutes
    5. Notice that the pods will scale down 20% every minute until reach to the minimum 2

## Clean up
1. Clean everything
```bash
kubectl delete -f ./k8s/services/app-load-balancer.yaml
kubectl delete -f ./k8s/autoscaler/app-hpa.yaml
kubectl delete -f ./k8s/deployments/app-deployment.yaml
kubectl delete -f ./k8s/namespace.yaml
```