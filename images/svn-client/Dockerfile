FROM alpine:latest
MAINTAINER Julien Garcia Gonzalez <jgonzalez@wemanity.com>

RUN apk add --update subversion curl vim && rm -rf /var/cache/apk/*
ENV EDITOR=/usr/bin/vim

VOLUME ["/src"]
WORKDIR /src

ENTRYPOINT ["/usr/bin/svn"]
