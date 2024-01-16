# Build
```
docker build -t gsdemo.azurecr.io/debianssh:latest -f Dockerfile
```

# Remove
```
docker stop debianssh ;
docker rm debianssh ;
docker rmi $(docker images -a -q) -f ; 
docker build -t gsdemo.azurecr.io/debianssh:latest -f Dockerfile ;

docker run --name debianssh -p 2222:2222 -p 8000:80 gsdemo.azurecr.io/debianssh:latest
```

# Run
```
docker run --name debianssh -p 2222:2222 -p 8000:80 gsdemo.azurecr.io/debianssh:latest
```

# Shell
```
docker exec -it debianssh bash
```

# Push
```
docker push gsdemo.azurecr.io/debianssh:latest
```

# Create Azure WebApp w/ vnet
```
az webapp create -g demo -p ASP-demo-83a0 -n debianssh --deployment-container-image-name gsdemo.azurecr.io/debianssh:latest --vnet vnet-acquapgb --subnet subnet-obkpbupj
```


# Delete Azure WebApp
```
az webapp delete -g demo -n debianssh
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