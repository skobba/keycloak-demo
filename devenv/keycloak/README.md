# Build and push
```
docker build -t gsdemo.azurecr.io/keycloak:5 -f Dockerfile ;
docker push gsdemo.azurecr.io/keycloak:5
```


# Create Azure WebApp w/ vnet
```
az webapp create -g demo -p ASP-demo-83a0 -n gskc --deployment-container-image-name gsdemo.azurecr.io/keycloak:5 --vnet vnet-acquapgb --subnet subnet-obkpbupj --startup-file="start-dev"
```

## Set ENV var on webapp
```
az webapp config appsettings set -g demo -n gskc --settings KC_DB_URL="jdbc:postgresql://gspgsingle.postgres.database.azure.com/keycloak?sslmode=require" 


az webapp config appsettings set -g demo -n gskc --settings  KC_DB_URL_HOST="postgres" KC_DB_URL_PORT="5432" JDBC_PARAMS="sslmode=require"


JDBC_PARAMS="sslmode=verify-ca&sslrootcert=/opt/jboss/postgres.crt.der"
```

## Setup startup command
```
az webapp config set -g demo -n gskc --startup-file="start-dev"
```

## Start/Stop
```
Start:
az webapp start -g demo -n gskc

Stop:
az webapp stop -g demo -n gskc
```

# Delete Azure WebApp
```
az webapp delete -g demo -n gskc
```

