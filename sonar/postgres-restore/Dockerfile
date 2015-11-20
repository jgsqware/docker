FROM alpine
MAINTAINER Julien Garcia Gonzalez <jgonzalez@wemanity.com>

RUN apk add --update \
              postgresql-client \

        && rm -rf /var/cache/apk/*

ENTRYPOINT ["/usr/bin/psql"]
