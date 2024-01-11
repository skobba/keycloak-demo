import psycopg2

# Connection details
host = 'postgres'
port = '5432'
database = 'keycloak'
user = 'keycloak'
password = 'keycloak'
sslmode = 'require'  # Set SSL mode to require
conn = psycopg2.connect(host=host, port=port, database=database,
                        user=user, password=password, sslmode=sslmode)