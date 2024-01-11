FROM postgres:13.2 as db

RUN apt-get update
RUN apt-get -y install vim

WORKDIR /root
COPY create_ssl_cert.sh .


WORKDIR /app
#COPY ./myinit.sh /docker-entrypoint-initdb.d/
#COPY ./init/01.sql /docker-entrypoint-initdb.d/
COPY ./init/keycloakdb.sql /docker-entrypoint-initdb.d/
