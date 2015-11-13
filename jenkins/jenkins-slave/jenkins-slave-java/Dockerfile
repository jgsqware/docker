FROM docker-registry:5000/frolvlad/java:8-jdk-alpine
MAINTAINER Julien Garcia Gonzalez <jgonzalez@wemanity.com>

RUN adduser -h "/home/jenkins_slave" -u 1000 -s /bin/bash -D jenkins_slave

RUN apk add --update \
              bash \
              git \
              && rm -rf /var/cache/apk/*

# get maven 3.2.2
RUN wget -O /tmp/apache-maven-3.2.2.tar.gz http://archive.apache.org/dist/maven/maven-3/3.2.2/binaries/apache-maven-3.2.2-bin.tar.gz

RUN mkdir /opt
RUN chown jenkins_slave:jenkins_slave /opt
# install maven
RUN tar xzf /tmp/apache-maven-3.2.2.tar.gz -C /opt/
RUN ln -s /opt/apache-maven-3.2.2 /opt/maven
RUN ln -s /opt/maven/bin/mvn /usr/local/bin
RUN rm -f /tmp/apache-maven-3.2.2.tar.gz
ENV MAVEN_HOME /opt/maven
