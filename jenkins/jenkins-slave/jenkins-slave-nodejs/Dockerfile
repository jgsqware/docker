FROM docker-registry:5000/node:0.12
MAINTAINER Julien Garcia Gonzalez <jgonzalez@wemanity.com>

RUN groupadd -g 1000 jenkins_slave
RUN useradd -d /home/jenkins_slave -s /bin/bash -m jenkins_slave -u 1000 -g jenkins_slave

RUN mkdir /usr/share/jenkins_slave
VOLUME ["/usr/share/jenkins_slave"]
