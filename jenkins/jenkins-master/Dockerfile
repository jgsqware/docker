FROM java:8-jdk

RUN apt-get update -qq \
    && apt-get install -qqy \
    wget \
    git \
    curl \
    zip \
    apt-transport-https \
    ca-certificates \
    curl \
    lxc \
    iptables \
    && rm -rf /var/lib/apt/lists/*

ENV JENKINS_HOME /var/jenkins_home
ENV JENKINS_SLAVE_AGENT_PORT 50000

# Jenkins is run with user `jenkins`, uid = 1000
# If you bind mount a volume from the host or a data container,
# ensure you use the same uid
RUN useradd -d "$JENKINS_HOME" -u 1000 -m -s /bin/bash jenkins

# Jenkins home directory is a volume, so configuration and build history
# can be persisted and survive image upgrades
VOLUME /var/jenkins_home

RUN mkdir /var/log/jenkins
RUN mkdir /var/cache/jenkins
RUN chown -R jenkins:jenkins /var/log/jenkins
RUN chown -R jenkins:jenkins /var/cache/jenkins

# `/usr/share/jenkins/ref/` contains all reference configuration we want
# to set on a fresh new installation. Use it to bundle additional plugins
# or config file with your custom jenkins Docker image.
RUN mkdir -p /usr/share/jenkins/ref/init.groovy.d

ENV TINI_SHA 066ad710107dc7ee05d3aa6e4974f01dc98f3888

# Use tini as subreaper in Docker container to adopt zombie processes
RUN curl -fL https://github.com/krallin/tini/releases/download/v0.5.0/tini-static -o /bin/tini && chmod +x /bin/tini \
  && echo "$TINI_SHA /bin/tini" | sha1sum -c -

COPY init.groovy /usr/share/jenkins/ref/init.groovy.d/tcp-slave-agent-port.groovy

ENV JENKINS_VERSION 1.625.1
ENV JENKINS_SHA c96d44d4914a154c562f21cd20abdd675ac7f5f3

# could use ADD but this one does not check Last-Modified header
# see https://github.com/docker/docker/issues/8331
RUN curl -fL http://mirrors.jenkins-ci.org/war-stable/$JENKINS_VERSION/jenkins.war -o /usr/share/jenkins/jenkins.war \
  && echo "$JENKINS_SHA /usr/share/jenkins/jenkins.war" | sha1sum -c -

ENV JENKINS_UC https://updates.jenkins-ci.org
RUN chown -R jenkins "$JENKINS_HOME" /usr/share/jenkins/ref

# for main web interface:
EXPOSE 8080

# will be used by attached slave agents:
EXPOSE 50000

ENV COPY_REFERENCE_FILE_LOG $JENKINS_HOME/copy_reference_file.log
COPY jenkins-docker.sh /usr/local/bin/jenkins-docker.sh
RUN chmod +x /usr/local/bin/jenkins-docker.sh


# from a derived Dockerfile, can use `RUN plugins.sh active.txt` to setup /usr/share/jenkins/ref/plugins from a support bundle
COPY plugins.sh /usr/local/bin/plugins.sh
RUN chmod +x /usr/local/bin/plugins.sh
COPY jenkins_plugins.txt /tmp/jenkins_plugins.txt
RUN /usr/local/bin/plugins.sh /tmp/jenkins_plugins.txt
RUN rm /tmp/jenkins_plugins.txt



# Install Docker from Docker Inc. repositories.
RUN curl -sSL https://get.docker.com/ubuntu/ | sh

# Define additional metadata for our image.
VOLUME /var/lib/docker


# RUN groupadd docker
# RUN usermod -aG docker jenkins
RUN usermod -aG users jenkins
# RUN echo "jenkins ALL=NOPASSWD: ALL" >> /etc/sudoers




USER jenkins
ENTRYPOINT ["/bin/tini", "--", "/usr/local/bin/jenkins-docker.sh"]


ENV JAVA_OPTS="-Xmx8192m"
ENV JENKINS_OPTS="--handlerCountStartup=100 --handlerCountMax=300 --logfile=/var/log/jenkins/jenkins.log --webroot=/var/cache/jenkins/war"
