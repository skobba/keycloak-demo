FROM alpine:latest

ARG name

ENV env_name $name
ENV SKOBBA=gjermund
COPY greetings.sh .

RUN echo $myenv
RUN chmod +x /greetings.sh

CMD ["/greetings.sh"]