FROM ubuntu:latest

ADD https://releases.hashicorp.com/sentinel/0.15.2/sentinel_0.15.2_linux_amd64.zip /sentinel.zip

RUN apt-get update && \
    apt-get install unzip && \
    unzip /sentinel.zip && \
    rm /sentinel.zip && \
    mv /sentinel /usr/bin/sentinel

ENTRYPOINT ["/usr/bin/sentinel"]