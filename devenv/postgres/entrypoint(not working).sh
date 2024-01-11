#!/bin/sh

echo "******************** docker-entrypoint.sh **********************"
echo "******************** docker-entrypoint.sh **********************"
echo "******************** docker-entrypoint.sh **********************"
echo "******************** docker-entrypoint.sh **********************"


# Before PostgreSQL can function correctly, the database cluster must be initialized:
# initdb -D /var/lib/postgresql/data

# # Edit pg_hba.conf to enable ssl on external connections
# ssl_conf.sh

# # internal start of server in order to allow set-up using psql-client
# # does not listen on external TCP/IP and waits until start finishes
# pg_ctl -D "/var/lib/postgresql/data" -o "-c listen_addresses=''" -w start

# # create a user or role
# psql -d postgresql -c "CREATE USER demouser WITH PASSWORD 'demopass';" 

# # create database 
# psql -v ON_ERROR_STOP=1 -d postgres -c "CREATE DATABASE dockertest OWNER 'demouser';"

# stop internal postgresql server
# pg_ctl -D "/var/lib/postgresql/data" -m fast -w stop

exec "$@"