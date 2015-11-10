FROM node:0.12
MAINTAINER Julien Garcia Gonzalez

RUN groupadd -g 1000 jenkins_slave
RUN useradd -d /home/jenkins_slave -s /bin/bash -m jenkins_slave -u 1000 -g jenkins_slave
RUN echo jenkins_slave:jpass | chpasswd
RUN apt-get update && apt-get install -y openjdk-7-jre wget unzip
RUN wget -O /home/jenkins_slave/swarm-client-2.0-jar-with-dependencies.jar http://maven.jenkins-ci.org/content/repositories/releases/org/jenkins-ci/plugins/swarm-client/2.0/swarm-client-2.0-jar-with-dependencies.jar

RUN apt-get install -y vim
COPY startup.sh /usr/bin/startup.sh
RUN chmod +x /usr/bin/startup.sh

RUN mkdir -p /tmp
RUN mkdir -p /usr/share/jenkins_slave

VOLUME ["/tmp","/usr/share/jenkins_slave"]
# USER jenkins_slave
ENTRYPOINT ["/usr/bin/startup.sh"]
