#!/bin/bash
DOCKER_HOST=$(getent hosts jenkins-master | awk '{ print $1 }')
JENKINS_SERVER=${JENKINS_SERVER:-$DOCKER_HOST}
JENKINS_PORT=${JENKINS_PORT:-8080}
JENKINS_LABELS=${JENKINS_LABELS:-swarm}
JENKINS_HOME=${JENKINS_HOME:-$HOME}
echo "Starting up swarm client with args:"
echo "$@"
echo "and env:"
echo "$(env)"
set -x
echo "Running java -jar /home/jenkins_slave/swarm-client-2.0-jar-with-dependencies.jar -fsroot "$JENKINS_HOME" -labels "$JENKINS_LABELS" -master http://$JENKINS_SERVER:$JENKINS_PORT $@"
java -jar /home/jenkins_slave/swarm-client-2.0-jar-with-dependencies.jar -fsroot "$JENKINS_HOME" -labels "$JENKINS_LABELS" -master http://$JENKINS_SERVER:$JENKINS_PORT $@
sleep infinity
