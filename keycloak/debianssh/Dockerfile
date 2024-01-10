FROM debian:latest

# app
RUN mkdir -p /app
WORKDIR /app
# RUN echo 'Ubuntu with psql' >> /app/index.html
RUN echo '$mydesc' >> /app/index.html

# ssh
RUN apt-get update
RUN apt-get -y install openssh-server python3

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

