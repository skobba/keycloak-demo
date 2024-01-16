For those who try to solve this one without tempering with security.config to get this working for Azure Flexible PostgresSQL server. By adding the certificate from: https://learn.microsoft.com/en-us/azure/postgresql/flexible-server/how-to-connect-tls-ssl Into /opt/keycloak/.postgresql/root.crt and setting KC_DB_URL_PROPERTIES="?sslmode=verify-full"

Flexible server, is still using the old SHA1 Root Certificate, causing error.

```sh
FROM alpine/curl:8.1.2 as digicert

WORKDIR /app
RUN curl https://dl.cacerts.digicert.com/DigiCertGlobalRootCA.crt.pem -o DigiCertGlobalRootCA.crt.pem

FROM quay.io/keycloak/keycloak:21.1
COPY --from=digicert /app/DigiCertGlobalRootCA.crt.pem /opt/keycloak/.postgresql/root.crt
```
