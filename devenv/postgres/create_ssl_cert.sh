cd /var/lib/postgresql/data
openssl req -nodes -new -x509 -keyout server.key -out server.crt -subj "/C=US/L=NYC/O=Percona/CN=postgres"

# change ownership and permissions.  It depend on the underlying operating system.  Userid 70 is postgres on the postgres:alpine image
chown 70:70 server.{crt,key}
chmod 600 server.{crt,key}

# chmod 400 server.{crt,key}
# chown postgres:postgres server.{crt,key}


ls -la server.{crt,key}