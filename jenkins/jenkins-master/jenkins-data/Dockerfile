FROM alpine
MAINTAINER Julien Garcia Gonzalez <jgonzalez@wemanity.com>

RUN adduser -h "/var/jenkins_home" -u 1000 -s /bin/bash -D jenkins
RUN mkdir -p /var/log/jenkins
RUN chown -R jenkins:jenkins /var/log/jenkins

VOLUME ["/var/log/jenkins", "/var/jenkins_home"]
USER jenkins

CMD ["echo", "Data container for Jenkins"]
