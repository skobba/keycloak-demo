#!/bin/bash
set -e

echo Create random db
psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
    CREATE DATABASE random;
EOSQL

cp /var/lib/postgresql/server.key /var/lib/postgresql/data/
cp /var/lib/postgresql/server.crt /var/lib/postgresql/data/


# echo Generate ssl cert on server
# cd /var/lib/postgresql/data
# openssl req -nodes -new -x509 -keyout server.key -out server.crt -subj "/C=US/L=NYC/O=Percona/CN=postgres"
# chmod 400 server.{crt,key}
# chown postgres:postgres server.{crt,key}
# ls -la server.{crt,key}

echo ssl conf
sed -i 's/host all all all md5/hostssl all all all md5/' /var/lib/postgresql/data/pg_hba.conf

echo Turn on ssl
psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
    alter system set ssl=on;
EOSQL

echo Reaload config
psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
    select pg_reload_conf();
EOSQL