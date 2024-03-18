# Cyberspeed_Assesment
This Assesment should include Docker, Kubernets, Minikube/AWS.

## Build App
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