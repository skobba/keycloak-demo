# docker-compose
## Build
```
docker-compose -f compose.yaml build
```

## Run
```
docker-compose -f compose.yaml up
```

## Exec
```
docker-compose exec postgres sh
docker-compose exec keycloak sh
```

## Fix Socket
```
export DOCKER_HOST=unix:///run/user/1000/podman/podman.sock

export DOCKER_HOST=ssh://core@127.0.0.1:53473/run/user/1412831964/podman/podman.sock
```

# Run with Docker
```
docker run --name mykeycloak -p 8443:8443 \
        -e KEYCLOAK_ADMIN=admin -e KEYCLOAK_ADMIN_PASSWORD=admin1234 \
        mykeycloak \
        start --optimized
```


