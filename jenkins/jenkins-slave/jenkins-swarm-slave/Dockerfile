# FROM develar/java
# MAINTAINER Julien Garcia Gonzalez <jgonzalez@wemanity.com>
# RUN apk add --update \
#               bash \
#               git \
#               && rm -rf /var/cache/apk/*
FROM java:jre
MAINTAINER Julien Garcia Gonzalez <jgonzalez@wemanity.com>
RUN apt-get update && \
    apt-get install -y git bash lxc libltdl7 && \
    rm -rf /var/lib/apt/lists/*

RUN useradd -d "/home/jenkins_slave" -u 1000 -m -s /bin/bash jenkins_slave

RUN wget -O /home/jenkins_slave/swarm-client-2.0-jar-with-dependencies.jar http://maven.jenkins-ci.org/content/repositories/releases/org/jenkins-ci/plugins/swarm-client/2.0/swarm-client-2.0-jar-with-dependencies.jar

COPY startup.sh /usr/bin/startup.sh
RUN chmod +x /usr/bin/startup.sh

RUN mkdir -p /tmp
RUN mkdir -p /usr/share/jenkins_slave

VOLUME ["/tmp","/usr/share/jenkins_slave"]
ENTRYPOINT ["/usr/bin/startup.sh"]
