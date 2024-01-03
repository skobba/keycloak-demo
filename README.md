# Docker
```
docker build -t skobbawebapp:latest .
docker stop skobbawebappcont & docker rm skobbawebappcont & docker image rm localhost/skobbawebapp:latest
docker run -td --name skobbawebappcont skobbawebapp
docker run --name skobbawebappcont -p 3000:3000 skobbawebapp
docker logs skobbawebappcont
docker exec -it skobbawebappcont sh

docker rmi localhost/skobbawebapp:latest

DATABASE_URL postgres://postgres:qwe123qwe123@Bemanning:5432/Bemanning?sslmode=disable
postgres://postgres:qwe123qwe123@localhost:5432/Bemanning
```
