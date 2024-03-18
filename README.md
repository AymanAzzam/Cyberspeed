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
2. Deploy the application pods
```bash
kubectl apply -f ./k8s/deployments/app-deployment.yaml
```
3. Deploy the load balancer
```bash
kubectl apply -f ./k8s/services/app-deployment.yaml
```
4. Test the cluster
```bash
minikube service app-service
```
5. Check Application logs
```bash
kubectl get pods
kubectl logs <pod-name>
```