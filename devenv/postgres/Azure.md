# Ref
* https://learn.microsoft.com/en-us/azure/postgresql/single-server/concepts-ssl-connection-security

## Create Postgres flexible server
```
az postgres flexible-server create -n gspgdb -g demo --location "northeurope" --admin-user keycloak --admin-password keycloak --vnet vnet-acquapgb --subnet subnet-nqnlui6nuir6e
```

## Connection string
```
postgresql://keycloak:keycloak@gspgdb.postgres.database.azure.com/flexibleserverdb?sslmode=require
```