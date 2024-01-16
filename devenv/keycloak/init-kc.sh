#!/bin/sh

export KC_DB="postgres"
# export KC_DB_URL="jdbc:postgresql://gspgdb.postgres.database.azure.com:5432/keycloak"
# export KC_DB_USERNAME="keycloak@gspgsingle"
export KC_DB_URL="jdbc:postgresql://postgres:5432/keycloak"
export KC_DB_USERNAME="keycloak"
export KC_DB_PASSWORD="sup-SEC-2000"
export KEYCLOAK_LOGLEVEL="DEBUG"

echo "******* printenv | grep KC | sort ******* "
printenv | grep KC | sort
echo "******* printenv | grep KC | sort ******* "

#sleep 10000
/opt/keycloak/bin/kc.sh start-dev