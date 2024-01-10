FROM node:18.16.0-alpine3.17

# app
RUN mkdir -p /app
WORKDIR /app
COPY ./app.js .
COPY ./package.json .
COPY ./package-lock.json .
RUN npm install

# ssh
ENV SSH_PASSWD "root:Docker!"

# RUN apt-get update \
#         && apt-get install -y --no-install-recommends dialog \
#         && apt-get update \
#  && apt-get install -y --no-install-recommends openssh-server \
#  && echo "$SSH_PASSWD" | chpasswd 

RUN apk add --update --no-cache openssh 


RUN echo "$SSH_PASSWD" | chpasswd 

COPY sshd_config /etc/ssh/
COPY init.sh /usr/local/bin/

RUN chmod u+x /usr/local/bin/init.sh
EXPOSE 80 2222

#CMD ["python", "/code/manage.py", "runserver", "0.0.0.0:8000"]
ENTRYPOINT ["init.sh"]

