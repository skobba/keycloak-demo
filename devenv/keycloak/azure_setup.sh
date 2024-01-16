#!/bin/sh

# Build and push images

## Keycloak
tag=13
imagename=gsdemo.azurecr.io/keycloak:$tag
webappname=gskc-$tag

echo "Build and setup: $webappname"

docker build -t $imagename -f Dockerfile ;
docker push $imagename

az webapp create -g demo -p ASP-demo-83a0 -n $webappname --deployment-container-image-name $imagename --vnet vnet-acquapgb --subnet subnet-obkpbupj --startup-file="start-dev" ; az webapp stop -g demo -n $webappname

az webapp stop -g demo -n $webappname

az webapp config appsettings set -g demo -n $webappname --settings KC_DB_URL="jdbc:postgresql://gspgsingle.postgres.database.azure.com:5432/keycloak" KEYCLOAK_LOGLEVEL="DEBUG" ROOT_LOGLEVEL="DEBUG" KEYCLOAK_ADMIN="admin" KEYCLOAK_ADMIN_PASSWORD="admin1234" KC_DB_USERNAME="keycloak@gspgsingle" KC_DB_PASSWORD="sup-SEC-2000" 

az webapp start -g demo -n $webappname


