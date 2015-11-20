#!/usr/bin/env bash
#Usage docker-machine-update-hosts.sh hosts.conf
#arg1 is a configuration file with hosts

#Remove existing lines from hosts
while read -r line; do
    [[ "$line" =~ ^#.*$ ]] && continue
  echo "Configuration: $line"
  IFS='=' read -a configuration <<< "$line"
  machine=${configuration[0]}

  IFS=',' read -a hosts <<< "${configuration[1]}"

  DOCKER_IP=$(docker-machine ip $machine)
  for host in "${hosts[@]}"; do
    echo "Adding $DOCKER_IP  $host"
    sudo bash -c "sed -i '' '/^192\.168\.99\.[[:digit:]]\{0,3\}[[:space:]]*$host/d' /etc/hosts"
    sudo bash -c "echo '$DOCKER_IP  $host' >> /etc/hosts"
  done

done < "$1"
