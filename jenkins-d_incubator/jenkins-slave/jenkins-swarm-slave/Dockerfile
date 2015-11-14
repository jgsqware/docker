FROM docker-registry:5000/develar/java:8-JRE-alpine
MAINTAINER Julien Garcia Gonzalez <jgonzalez@wemanity.com>
RUN apk add --update \
              bash \
              git \
              && rm -rf /var/cache/apk/*
RUN adduser -h "/home/jenkins_slave" -u 1000 -s /bin/bash -D jenkins_slave

RUN wget -O /home/jenkins_slave/swarm-client-2.0-jar-with-dependencies.jar http://maven.jenkins-ci.org/content/repositories/releases/org/jenkins-ci/plugins/swarm-client/2.0/swarm-client-2.0-jar-with-dependencies.jar

COPY startup.sh /usr/bin/startup.sh
RUN chmod +x /usr/bin/startup.sh

RUN mkdir -p /tmp
RUN mkdir -p /usr/share/jenkins_slave

VOLUME ["/tmp","/usr/share/jenkins_slave"]
ENTRYPOINT ["/usr/bin/startup.sh"]
