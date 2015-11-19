Available until friday
mick.coleman@docker.com
https://github.com/docker/ucp_lab
https://github.com/docker/dceu_tutorials

#Sharing layer

images can share images layers

# New commercial support license
3 majors version releases supported in parallel
support time perio is  6 months per release or period for 3 release

# Docker Volume Command

```
  > docker volume create
  > docker volume ls
```

You can reference the volume by the name

```
> docker volume ls
/var/lib  test-volume

> docker run -v test-volume:/var/host"
```

# Network

User overlay for multiple host

Through consul, just have to put consul connection in the DOCKER_OPTS and restart the daemon

#DUCP
DUCP use ETCD as discovery service

#TIPS

Use consul as DNS server
