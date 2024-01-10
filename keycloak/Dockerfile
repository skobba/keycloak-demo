FROM quay.io/keycloak/keycloak:22.0.5 as builder
#FROM quay.io/keycloak/keycloak:latest as builder

# Enable health and metrics support
ENV KC_HEALTH_ENABLED=true
ENV KC_METRICS_ENABLED=true

# Configure a database vendor
ENV KC_DB=postgres

WORKDIR /opt/keycloak

# COPY ./DigiCertGlobalRootCA.crt.pem /opt/keycloak/.postgresql/root.crt
# for demonstration purposes only, please make sure to use proper certificates in production instead
RUN keytool -genkeypair -storepass password -storetype PKCS12 -keyalg RSA -keysize 2048 -dname "CN=server" -alias server -ext "SAN:c=DNS:localhost,IP:127.0.0.1" -keystore conf/server.keystore

RUN /opt/keycloak/bin/kc.sh build

FROM quay.io/keycloak/keycloak:22.0.5
#FROM quay.io/keycloak/keycloak:latest

# ARG MY_KEYCLOAK_ADMIN_PASSWORD
# RUN echo $MY_KEYCLOAK_ADMIN_PASSWORD

COPY --from=builder /opt/keycloak/ /opt/keycloak/

# change these values to point to a running postgres instance
ENV KC_DB=postgres

# get this from runtime (docker-compose)
# ENV KC_DB_URL=jdbc:postgresql://keycloak:keycloak@gspostgres.postgres.database.azure.com/keycloak
# ENV KC_DB_URL=jdbc:postgresql://gspostgres.postgres.database.azure.com
# ENV KC_DB_URL=jdbc:postgresql://gspgdb.postgres.database.azure.com:5432/keycloak
# ENV KC_DB_URL_PROPERTIES="?sslmode=verify-full"
# ENV KC_DB_URL=jdbc:postgresql://postgres:5432/keycloak

ENV KC_DB_USERNAME=keycloak
ENV KC_DB_PASSWORD=keycloak

ENV KEYCLOAK_LOGLEVEL=DEBUG
#ENV KC_HOSTNAME=localhost

# get this from runtime (docker-compose)
# ENV KEYCLOAK_ADMIN=admin
# ENV KEYCLOAK_ADMIN_PASSWORD=admin1234

#ENTRYPOINT ["/opt/keycloak/bin/kc.sh", "start-dev"]
ENTRYPOINT ["/opt/keycloak/bin/kc.sh"]

