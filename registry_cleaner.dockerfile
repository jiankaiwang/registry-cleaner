FROM ubuntu:18.04

LABEL maintainer="JianKai Wang <gljankai@gmail.com>"

WORKDIR /cron
ADD registry .
RUN chmod +x registry

ADD gc.yaml /etc/docker/registry/gc.yaml

RUN apt-get update
RUN apt-get install cron

ADD crons .

ADD clean.sh .
RUN chmod +x clean.sh

ADD init.sh .
RUN chmod +x init.sh

CMD ["bash", "init.sh"]