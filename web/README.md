# Build Nginx Image
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