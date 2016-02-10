FROM jdubois/jhipster-docker
MAINTAINER Julien Garcia Gonzalez <jgonzalez@wemanity.com>

RUN usermod -u 10000 jhipster
RUN useradd -d "/home/jenkins_slave" -u 1000 -s /bin/bash -m jenkins_slave

RUN chown jenkins_slave:jenkins_slave /opt

USER jenkins_slave
