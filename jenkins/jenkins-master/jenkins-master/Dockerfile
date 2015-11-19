FROM jenkins
MAINTAINER Julien Garcia Gonzalez <jgonzalez@wemanity.com>

COPY configuration/plugins.txt /usr/share/jenkins/ref/
RUN /usr/local/bin/plugins.sh /usr/share/jenkins/ref/plugins.txt

COPY configuration/org.jenkinsci.plugins.docker.commons.tools.DockerTool.xml /usr/share/jenkins/ref/org.jenkinsci.plugins.docker.commons.tools.DockerTool.xml
