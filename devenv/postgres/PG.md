# PG
## Enabling SSL/TLS

Ref.: https://demirhuseyinn-94.medium.com/postgresql-ssl-configuration-to-connect-database-114f867d96e0

### datadir
/var/lib/postgresql/data

### Create private.key
```
su - postgres
cd /var/lib/postgresql/data
openssl genrsa -aes128 2048 > server.key
openssl rsa -in server.key -out server.key
```

Enter pass phrase: gjermund

```
chmod 400 server.key
chown postgres:postgres server.key
```

### Generate root cert
```
Generate trusted root certificate
su - postgres
cd /var/lib/postgresql/data
openssl req -new -key server.key -days 365 -out server.crt -x509
cp server.crt root.crt
```

```
You are about to be asked to enter information that will be incorporated
into your certificate request.
What you are about to enter is what is called a Distinguished Name or a DN.
There are quite a few fields but you can leave some blank
For some fields there will be a default value,
If you enter '.', the field will be left blank.
-----
Country Name (2 letter code) [AU]:NO
State or Province Name (full name) [Some-State]:Oslo
Locality Name (eg, city) []:Oslo
Organization Name (eg, company) [Internet Widgits Pty Ltd]:
Organizational Unit Name (eg, section) []:
Common Name (e.g. server FQDN or YOUR name) []:gjermund
Email Address []:gjermund@skobba.net
```

### Edit config
vi /var/lib/postgresql/data/postgresql.conf

Add
```
ssl = on
ssl_ca_file = 'root.crt'
ssl_cert_file = 'server.crt'
ssl_crl_file = ''
ssl_key_file = 'server.key'
ssl_ciphers = 'HIGH:MEDIUM:+3DES:!aNULL' ### allowed SSL ciphers
ssl_prefer_server_ciphers = on
```

Restart pg
```
service postgresql restart
service postgresql status
```

### Reload config
```
alter system set ssl=on;
select pg_reload_conf();
```

## Enforcing SSL/TLS
Ref.: https://www.percona.com/blog/enabling-and-enforcing-ssl-tls-for-postgresql-connections/

vi pg_hba.conf
```

```