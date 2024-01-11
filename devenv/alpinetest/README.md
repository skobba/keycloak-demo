# Docker commands
```
# Remove
docker stop alpinetest ;
docker rm alpinetest ;
docker rmi $(docker images -a -q) -f ; 

# Build
docker build -t alpinetest -f Dockerfile --build-arg name=Gjermund;

# Run
docker run --name alpinetest -e myenv=Skobba alpinetest

# Shell
docker exec -it alpinetest bash
```