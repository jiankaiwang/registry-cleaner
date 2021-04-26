FROM ubuntu:18.04

LABEL maintainer="JianKai Wang <gljankai@gmail.com>"

WORKDIR /cron
ADD crons .
ADD registry .
RUN chmod +x registry
ADD clean.sh .

ADD gc.yaml /etc/docker/registry/gc.yaml

RUN apt-get update
RUN apt-get install cron

RUN chmod +x clean.sh
RUN chmod 0600 crons

RUN crontab -u root crons

ENTRYPOINT ["cron", "-f"]