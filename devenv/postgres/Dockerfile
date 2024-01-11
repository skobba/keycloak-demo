FROM postgres:13.2 as db

RUN apt-get update
RUN apt-get -y install vim

COPY ./server.key /var/lib/postgresql/
COPY ./server.crt /var/lib/postgresql/

WORKDIR /var/lib/postgresql
RUN chown postgres:postgres server.crt
RUN chown postgres:postgres server.key

COPY ./init/keycloakdb.sql /docker-entrypoint-initdb.d/

COPY /init.sh /docker-entrypoint-initdb.d/
RUN chmod +x /docker-entrypoint-initdb.d/init.sh

# # NOT WORKING!!!
# ENTRYPOINT ["/init.sh"] 
# CMD [ "-c", "ssl=on" , "-c", "ssl_cert_file=/var/lib/postgresql/server.crt", "-c",\
#      "ssl_key_file=/var/lib/postgresql/server.key"]