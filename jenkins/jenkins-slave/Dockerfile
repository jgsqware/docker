FROM java:8-jdk


ENV HOME /home/jenkins
RUN groupadd -g 10000 jenkins
RUN useradd -c "Jenkins user" -d $HOME -u 10000 -g 10000 -m jenkins


RUN curl --create-dirs -sSLo /home/jenkins/slave.jar http://repo.jenkins-ci.org/public/org/jenkins-ci/main/remoting/2.52/remoting-2.52.jar \
  && chmod 755 /home/jenkins \
  && chmod 644 /home/jenkins/slave.jar

WORKDIR $HOME
USER jenkins

RUN mkdir /home/jenkins/.tmp

VOLUME ["/home/jenkins"]
