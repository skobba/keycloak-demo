FROM debian:latest

# python3 (allready on container)
RUN apt-get update
RUN apt-get -y install vim
RUN apt-get -y install python3-pip python3-venv
RUN apt-get -y install libpq-dev python-dev-is-python3

# FAILING!!!
#RUN pip3 install psycopg2

# app
RUN mkdir -p /app
WORKDIR /app
#RUN echo '$mydesc' >> /app/index.html
COPY dbtest.py .
COPY DigiCertGlobalRootCA.crt.pem .

# ssh
RUN apt-get update
RUN apt-get -y install openssh-server

# psql
RUN apt-get -y install postgresql-client


# ssh setup
COPY sshd_config /etc/ssh/
COPY start.sh /usr/local/bin/

RUN mkdir /var/run/sshd
RUN echo 'root:Docker!' | chpasswd
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

RUN chmod u+x /usr/local/bin/start.sh

EXPOSE 80 2222

ENTRYPOINT start.sh

