# Build and push
```
docker build -t gsdemo.azurecr.io/keycloak:2 -f Dockerfile ;
docker push gsdemo.azurecr.io/keycloak:2
```


# Create Azure WebApp w/ vnet
```
az webapp create -g demo -p ASP-demo-83a0 -n gskc --deployment-container-image-name gsdemo.azurecr.io/keycloak:2 --vnet vnet-acquapgb --subnet subnet-obkpbupj
```

## Set ENV var on webapp
```
az webapp config appsettings set -g demo -n gskc --settings KC_DB_URL="jdbc:postgresql://gspgdb.postgres.database.azure.com/keycloak?sslmode=require" KEYCLOAK_LOGLEVEL="DEBUG" ROOT_LOGLEVEL="DEBUG" KEYCLOAK_ADMIN="admin" KEYCLOAK_ADMIN_PASSWORD="admin1234"


az webapp config appsettings set -g demo -n gskc --settings  KC_DB_URL_HOST="postgres" KC_DB_URL_PORT="5432" JDBC_PARAMS="sslmode=verify-ca"


JDBC_PARAMS="sslmode=verify-ca&sslrootcert=/opt/jboss/postgres.crt.der"
```

## Setup startup command
```
az webapp config set -g demo -n gskc --startup-file="start-dev"
```

# Delete Azure WebApp
```
az webapp delete -g demo -n gskc
```

