# Azure

# Create Azure WebApp w/ vnet
```sh
# LinuxServerLarge / ASP-demo-83a0
az webapp create -g demo -p ASP-demo-83a0 -n gskc-10 --deployment-container-image-name gsdemo.azurecr.io/keycloak:10 --vnet vnet-acquapgb --subnet subnet-obkpbupj --startup-file="start-dev" ; az webapp stop -g demo -n gskc-10


```

## Start/Stop
```sh
az webapp stop -g demo -n gskc-10 ;
az webapp start -g demo -n gskc-10
az webapp delete -g demo -n gskc-10 
```

## Set env
```sh

az webapp config appsettings set -g demo -n gskc-10 --settings KC_DB_URL="jdbc:postgresql://gspgsingle.postgres.database.azure.com:5432/keycloak" KEYCLOAK_LOGLEVEL="DEBUG" ROOT_LOGLEVEL="DEBUG" KEYCLOAK_ADMIN="admin" KEYCLOAK_ADMIN_PASSWORD="admin1234" KC_DB_USERNAME="keycloak@gspgsingle" KC_DB_PASSWORD="sup-SEC-2000" ; az webapp start -g demo -n gskc-10

JDBC_PARAMS="sslmode=verify-ca&sslrootcert=/opt/jboss/postgres.crt.der"
```

## Set ENV var on webapp
```sh
WABAPP="gskc-6"

KC_DB_URL="jdbc:postgresql://gspgsingle.postgres.database.azure.com:5432/keycloak"
KEYCLOAK_LOGLEVEL="DEBUG"
ROOT_LOGLEVEL="DEBUG" 
KEYCLOAK_ADMIN="admin"
KEYCLOAK_ADMIN_PASSWORD="admin1234"
KC_DB_USERNAME="keycloak@gspgsingle" 
KC_DB_PASSWORD="sup-SEC-2000"
KC_DB_HOST="gspgsingle.postgres.database.azure.com"
KC_DB_URL_HOST="jdbc:postgresql://gspgsingle.postgres.database.azure.com:5432/keycloak"


az webapp config appsettings set -g demo -n gckc-8 --settings KC_DB_URL="$KC_DB_URL"
KEYCLOAK_LOGLEVEL="$KEYCLOAK_LOGLEVEL" ROOT_LOGLEVEL="$ROOT_LOGLEVEL" KEYCLOAK_ADMIN="$KEYCLOAK_ADMIN" KEYCLOAK_ADMIN_PASSWORD="$KEYCLOAK_ADMIN_PASSWORD" KC_DB_USERNAME="$KC_DB_USERNAME" KC_DB_PASSWORD="$KC_DB_PASSWORD" KC_DB_HOST="$KC_DB_HOST" KC_DB_URL_HOST="$KC_DB_URL_HOST"
```


