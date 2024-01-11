# Build
```
docker build -t ubuntussh:latest -f Dockerfile
```
# Remove
```
docker stop ubuntussh ;
docker rm ubuntussh ;
docker rmi $(docker images -a -q) -f ; 
docker build -t ubuntussh:latest -f Dockerfile ;
docker run --name ubuntussh -p 2222:22 ubuntussh:latest -f
```

# Run
```
docker run --name ubuntussh -p 2222:22 ubuntussh:latest -f
```

# Inspect to get IP address
```
docker inspect --format='{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' <container-ID-or-name>
```
