FROM node:0.12
MAINTAINER Julien Garcia Gonzalez

# Make sure the package repository is up to date.
RUN apt-get update
RUN apt-get -y upgrade

# Install a basic SSH server
RUN apt-get install -y openssh-server
RUN sed -i 's|session    required     pam_loginuid.so|session    optional     pam_loginuid.so|g' /etc/pam.d/sshd
RUN mkdir -p /var/run/sshd

# Install JDK 7 (latest edition)
RUN apt-get install -y openjdk-7-jdk

RUN groupadd -g 1000 jenkins_slave
RUN useradd -d /home/jenkins_slave -s /bin/bash -m jenkins_slave -u 1000 -g jenkins_slave
RUN echo jenkins_slave:jpass | chpasswd

RUN mkdir /usr/share/jenkins_slave
VOLUME ["/usr/share/jenkins_slave"]

# Standard SSH port
EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]
