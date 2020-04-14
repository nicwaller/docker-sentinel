FROM ubuntu:latest

ARG SENTINEL_VERSION

ADD https://releases.hashicorp.com/sentinel/${SENTINEL_VERSION}/sentinel_${SENTINEL_VERSION}_linux_amd64.zip /sentinel.zip

RUN apt-get update && \
    apt-get install unzip && \
    unzip /sentinel.zip && \
    rm /sentinel.zip && \
    mv /sentinel /usr/bin/sentinel

ENTRYPOINT ["/usr/bin/sentinel"]