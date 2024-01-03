

# Build in docker-compose
```
docker-compose -f compose.yaml build
```

# Exec
```
docker-compose exec postgres sh
docker-compose exec keycloak sh
```

# Fix Socket
```
export DOCKER_HOST=unix:///run/user/1000/podman/podman.sock

export DOCKER_HOST=ssh://core@127.0.0.1:53473/run/user/1412831964/podman/podman.sock
```

# Run
```
docker run --name mykeycloak -p 8443:8443 \
        -e KEYCLOAK_ADMIN=admin -e KEYCLOAK_ADMIN_PASSWORD=Pa$$word \
        mykeycloak \
        start --optimized
```

# Keycloak Administrator account
```
docker exec local_keycloak \
    /opt/jboss/keycloak/bin/add-user-keycloak.sh \
    -u admin \
    -p admin \
&& docker restart local_keycloak
```

# docker-compose
```
docker-compose -f compose.yaml up
```
