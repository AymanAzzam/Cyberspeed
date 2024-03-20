# Build Mysql Image
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