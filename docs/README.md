
# Start Jenkins swarm slave nodejs

```bash
docker run -d --hostname jenkins_swarm_slave_nodejs_1 --name jenkins_swarm_slave_nodejs_1 -e JENKINS_SERVER=10.213.230.9 -e JENKINS_PORT=8888 -e JENKINS_LABELS=swarm-nodejs docker-registry:5000/d.incubator/jenkins-swarm-slave-nodejs
```

# Run Jenkins Swarm typed slave
```bash
> docker run -d --hostname jenkins_swarm_slave_nodejs_1 --name jenkins_swarm_slave_nodejs_1 -e JENKINS_SERVER=http://10.215.77.11 -e JENKINS_PORT=8081 -e JENKINS_LABELS=swarm-nodejs jenkins-swarm-slave-nodejs
```

# Run Jenkins Swarm slave for dind
```bash
docker run -d \
  --hostname jenkins_swarm_slave_dind_1 \
  --name jenkins_swarm_slave_dind_1 \
  -e JENKINS_SERVER=10.213.230.9 \
  -e JENKINS_PORT=8888 \
  -e JENKINS_LABELS=swarm-dind \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -v /usr/local/bin/docker:/bin/docker \
  -v /tmp:/tmp \
  -v /usr/share/jenkins_slave:/usr/share/jenkins_slave \
  docker-registry:5000/d.incubator/jenkins-swarm-slave
```

# Error with docker-compose
> json: cannot unmarshal bool into Go value of type string

Due to `command: true`-> change to `command: "true"``
# docker
