# Build
```
docker build -t gsdemo.azurecr.io/debianslim:1 -f Dockerfile
```

# Remove
```
docker stop debianslim ;
docker rm debianslim ;
docker rmi $(docker images -a -q) -f ; 
docker build -t gsdemo.azurecr.io/debianslim:1 -f Dockerfile ;

docker run --name debianslim -p 2222:2222 -p 8000:80 gsdemo.azurecr.io/debianslim:1
```

# Run
```
docker run --name debianslim -p 2222:2222 -p 8000:80 gsdemo.azurecr.io/debianslim:1
```

# Shell
```
docker exec -it debianslim bash
```

# Push
```
docker push gsdemo.azurecr.io/debianslim:1
```

# Create Azure WebApp w/ vnet
```
az webapp create -g demo -p ASP-demo-83a0 -n debianslim --deployment-container-image-name gsdemo.azurecr.io/debianslim:2 --vnet vnet-acquapgb --subnet subnet-obkpbupj
```


# Delete Azure WebApp
```
az webapp delete -g demo -n debianslim
```

# Another Dockerfile
```
FROM debian:latest

RUN apt-get update && apt-get install -y openssh-server
RUN mkdir /var/run/sshd
RUN echo 'root:root123' | chpasswd
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]
```