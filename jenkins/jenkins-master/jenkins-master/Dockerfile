FROM jenkins
MAINTAINER Julien Garcia Gonzalez <jgonzalez@wemanity.com>

USER root
RUN mkdir /var/log/jenkins
RUN mkdir /var/cache/jenkins
RUN chown -R jenkins:jenkins /var/log/jenkins
RUN chown -R jenkins:jenkins /var/cache/jenkins
USER jenkins

ENV JAVA_OPTS="-Xmx8192m"
ENV JENKINS_OPTS="--handlerCountStartup=100 --handlerCountMax=300 --logfile=/var/log/jenkins/jenkins.log --webroot=/var/cache/jenkins/war"

COPY configuration/plugins.txt /usr/share/jenkins/ref/
RUN /usr/local/bin/plugins.sh /usr/share/jenkins/ref/plugins.txt

COPY configuration/org.jenkinsci.plugins.docker.commons.tools.DockerTool.xml /usr/share/jenkins/ref/org.jenkinsci.plugins.docker.commons.tools.DockerTool.xml
