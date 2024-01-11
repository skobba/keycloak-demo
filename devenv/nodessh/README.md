# Build
```
docker build -t gsdemo.azurecr.io/nodessh:latest -f Dockerfile
```
# Remove
```
docker stop nodessh ;
docker rm nodessh ;
docker rmi $(docker images -a -q) -f ; 
docker build -t gsdemo.azurecr.io/nodessh:latest -f Dockerfile ;

docker run --name nodessh -p 7000:8000 -p 2222:2222 gsdemo.azurecr.io/nodessh:latest

```

# Run
```
docker run --name nodessh -p 2222:22 nodessh:latest

docker run --name nodessh -p 2222:22 nodessh:latest "/bin/bash"
```

# push
```
docker push gsdemo.azurecr.io/nodessh:latest
```


# shell
```
docker exec -it nodessh sh
```