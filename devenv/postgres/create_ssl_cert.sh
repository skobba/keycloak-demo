#!/bin/bash

cd /var/lib/postgresql/data
openssl req -nodes -new -x509 -keyout server.key -out server.crt -subj "/C=US/L=NYC/O=Percona/CN=postgres"
chmod 400 server.{crt,key}
chown postgres:postgres server.{crt,key}
ls -la server.{crt,key}