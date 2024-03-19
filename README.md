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

## Build Nginx Image
1. Build the image
```bash
docker build -t web:1.0 .
```
2. Push the image to docker hub
```bash
docker login
docker tag web:1.0 <docker-hub-username>/web:1.0
docker push <docker-hub-username>/web:1.0
```

## Build Mysql Image
1. Build the image
```bash
docker build -t mysql:1.0 .
```
2. Push the image to docker hub
```bash
docker login
docker tag mysql:1.0 <docker-hub-username>/mysql:1.0
docker push <docker-hub-username>/mysql:1.0
```

## Build Kubernetes cluster using Minikube
1. Start Minikube
```bash
minikube start
```
2. Enable metric-server on the cluster for monitoring/autoscaling
```bash
minikube addons enable metrics-server
minikube addons list
```
3. Deploy The cluster
```bash
kubectl apply -k ./k8s/
```
4. Check the cluster dashboard
```bash
minikube dashboard
```

## Test the cluster application
1. Change kubernetes config to the development namespace
```bash
kubectl config set-context --current --namespace=development
```
2. Test the cluster by accessing the load balancer
```bash
minikube service app-service --namespace development
```
3. Check Application logs
```bash
kubectl get pods
kubectl logs <pod-name>
```

## Test Autoscaling
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
1. Delete all the cluster components
```bash
kubectl delete -k ./k8s/
```