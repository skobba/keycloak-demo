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

# Docker
## Build and run
```
docker stop keycloak ;
docker rm keycloak ;
docker rmi $(docker images -a -q) -f ; 
docker build -t gsdemo.azurecr.io/keycloak:1 -f Dockerfile ;
docker push gsdemo.azurecr.io/keycloak:1 ;
docker run --name keycloak -p 2222:2222 -p 8000:80 gsdemo.azurecr.io/keycloak:1
```

# Create WebApp
```
az webapp create -n keycloak -g demo -p ASP-demo-83a0 -i gsdemo.azurecr.io/keycloak:1 --location "northeurope" --vnet vnet-acquapgb --subnet subnet-nqnlui6nuir6e

az webapp create -g demo -p ASP-demo-83a0 -n gskeycloak --deployment-container-image-name gsdemo.azurecr.io/keycloak:1

az container create --resource-group myResourceGroup --name mycontainer --image mcr.microsoft.com/azuredocs/aci-helloworld --dns-name-label aci-demo --ports 80

az container create --resource-group demo --name keycloak --image gsdemo.azurecr.io/keycloak:1 --dns-name-label aci-demo --ports 80
```

## Connection strings
```

psql postgresql://dbadmin:P4ssword@gspgdb.postgres.database.azure.com/flexibleserverdb?sslmode=require


psql postgresql://dbadmin%40gspgdb-single:Pa48338word@gspgdb-single.postgres.database.azure.com/postgres?sslmode=require

psql -h gspgdb-single.postgres.database.azure.com -U dbadmin@gspgdb-single postgres

psql postgresql://gspgdb.postgres.database.azure.com:5432/keycloak

```
# postgres
```
CREATE USER keycloak WITH PASSWORD 'keycloak';
CREATE DATABASE keycloak;
```

## Fix Socket
```
export DOCKER_HOST=unix:///run/user/1000/podman/podman.sock

export DOCKER_HOST=ssh://core@127.0.0.1:53473/run/user/1412831964/podman/podman.sock
```

# Docker
## Build
```
docker build -t gsdemo.azurecr.io/kcskobba -f Dockerfile
```

## Run
```
docker run --name mykeycloak -p 8443:8443 \
        -e KEYCLOAK_ADMIN=admin -e KEYCLOAK_ADMIN_PASSWORD=admin1234 \
        mykeycloak \
        start --optimized
```


## Azure CLI
```
az webapp config appsettings set --resource-group <resource-group-name> --name <app-name> --settings PGADMIN_DEFAULT_EMAIL="user@domain.com" PGADMIN_DEFAULT_PASSWORD="SuperSecret"

az webapp config appsettings set --resource-group demo --name gspgadmin4 --settings PGADMIN_DEFAULT_EMAIL="demo@demo.com" PGADMIN_DEFAULT_PASSWORD="demo1234" PGADMIN_CONFIG_ENHANCED_COOKIE_PROTECTION="False" PGADMIN_CONFIG_CONSOLE_LOG_LEVEL="10"
```

Set docker cred
```
az webapp config appsettings set --resource-group demo --name kcskobba --settings DOCKER_REGISTRY_SERVER_URL="https://gsdemo.azurecr.io" DOCKER_REGISTRY_SERVER_USERNAME="gsdemo" DOCKER_REGISTRY_SERVER_PASSWORD="G6Uke4Q2qTvvXNjpTkXBzxrnV7iedLgVhOXa70PLqv+ACRAqsWax"
```

Set Keycloak env
```
az webapp config appsettings set --resource-group demo --name kcskobba --settings KC_DB="postgres" KC_DB_URL="jdbc:postgresql://gspostgres.postgres.database.azure.com:5432/keycloak" KC_DB_USERNAME="keycloak" KC_DB_PASSWORD="keycloak" KEYCLOAK_ADMIN="admin" KEYCLOAK_ADMIN_PASSWORD="admin1234"
```

Build and deploy
```
docker rmi $(docker images -a -q) -f ; docker build -t gsdemo.azurecr.io/kcskobba -f Dockerfile ; docker push gsdemo.azurecr.io/kcskobba

```
az webapp config appsettings list --resource-group demo --name gspgadmin

[
  {
    "name": "DOCKER_REGISTRY_SERVER_PASSWORD",
    "slotSetting": false,
    "value": null
  },
  {
    "name": "DOCKER_REGISTRY_SERVER_URL",
    "slotSetting": false,
    "value": "https://index.docker.io"
  },
  {
    "name": "DOCKER_REGISTRY_SERVER_USERNAME",
    "slotSetting": false,
    "value": ""
  },
  {
    "name": "PGADMIN_CONFIG_CONSOLE_LOG_LEVEL",
    "slotSetting": false,
    "value": "10"
  },
  {
    "name": "PGADMIN_CONFIG_ENHANCED_COOKIE_PROTECTION",
    "slotSetting": false,
    "value": "False"
  },
  {
    "name": "PGADMIN_DEFAULT_EMAIL",
    "slotSetting": false,
    "value": "demo@demo.com"
  },
  {
    "name": "PGADMIN_DEFAULT_PASSWORD",
    "slotSetting": false,
    "value": "demo1234"
  },
  {
    "name": "WEBSITES_ENABLE_APP_SERVICE_STORAGE",
    "slotSetting": false,
    "value": "false"
  }
]

# PG DB
admin: ohvwwrgttx
password: 36F1P16Z26$

# AZURE_POSTGRESQL_CONNECTIONSTRING
Database=keycloak;Server=gspostgres.postgres.database.azure.com;User Id=keycloak;Password=keycloak

# Start/Stop
```
az webapp start --name kcskobba --resource-group demo
az webapp stop --name kcskobba --resource-group demo
```

## SSL for Postgres in Production
Ref.: https://learn.microsoft.com/en-us/azure/postgresql/flexible-server/how-to-connect-tls-ssl


## Create WebApp
Create a web app with an image from a private Azure Container Registry
```
az webapp create -g MyResourceGroup -p MyPlan -n MyUniqueAppName -i myregistry.azurecr.io/docker-image:tag

az webapp create -g demo -p ASP-demo-83a0 -n gjermundsapp -i gsdemo.azurecr.io/kcskobba
```

Add vnet to a webapp
```
az webapp vnet-integration add -g MyResourceGroup -n MyWebapp --vnet MyVnetName --subnet MySubnetName -s [slot]

az webapp vnet-integration add -g demo -n gjermundsapp --vnet vnet-acquapgb --subnet subnet-obkpbupj
```

## Create Postgres
Create postgres database server (Azure Database for PostgreSQL single server)
```
az postgres server create --name $server --resource-group $resourceGroup --location "$location" --admin-user $login --admin-password $password --sku-name $sku

az postgres server create -n gspgdb -g demo --location "northeurope" --admin-user dbuser --admin-password bra-LANGT-2003
```

Create postgres database with "az postgres up" (Azure Database for PostgreSQL single server) - configures firewall with local ip
```
az postgres up -g MyResourceGroup -s MyServer -d MyDatabase -u MyUsername -p MyPassword

NB: USERNAME BECOMES gjermund@gspgdb:
az postgres up -g demo -s gspgdb -d mydb -u gjermund -p bra-LANGT-2003
```

Create firewall rule
```
az postgres server firewall-rule create -g demo -s dbservername -n {rule_name} --start-ip-address {ip_address} --end-ip-address {ip_address}
```

## Difference between postgres databases
"Azure Database for PostgreSQL flexible server" uses another SSL alg then "Azure Database for PostgreSQL single server"

## psql
psql --host=gspgdb2.postgres.database.azure.com --port=5432 --username=dbadmin@gspgdb2 --dbname=postgres

psql postgresql://<admin_user>%40<server_name>@<server_name>.postgres.database.azure.com:5432/postgres

psql postgresql://dbadmin:P4ssword@gspgdb2.postgres.database.azure.com/flexibleserverdb?sslmode=require



az postgres server  update --resource-group demo --name gspgdb2 --ssl-enforcement Disabled


## Create VM
```
az vm create -g demo -n myVM --image Debian11 --admin-username demouser --admin-password SecureP4$$word --location northeurope
  ```

## Create postgres single server
```
az postgres server create -n gspgdb-single -g demo --location "northeurope" --admin-user dbadmin --admin-password Pa$$word
```


# Create webapp for pgadmin4
```
az webapp create -g demo -p ASP-demo-83a0 -n pgadmin --deployment-container-image-name dpage/pgadmin4 --vnet vnet-acquapgb --subnet subnet-obkpbupj
```

Set admin username and password
```
az webapp config appsettings set --resource-group demo --name pgadmin --settings PGADMIN_DEFAULT_EMAIL="admin@skobba.net" PGADMIN_DEFAULT_PASSWORD="admin"
```