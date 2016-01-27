FROM alpine:latest
MAINTAINER Julien Garcia Gonzalez <jgonzalez@wemanity.com>

RUN apk add --update subversion curl && rm -rf /var/cache/apk/*

VOLUME ["/src"]
WORKDIR /src

ENTRYPOINT ["/usr/bin/svn"]
