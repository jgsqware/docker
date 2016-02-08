FROM ubuntu:trusty
MAINTAINER jgsqware <jgonzalez@wemanity.com>

RUN apt-get update && apt-get install -y \
    aufs-tools \
    automake \
    build-essential \
    curl \
    dpkg-sig \
    libcap-dev \
    libsqlite3-dev \
    lxc=1.0* \
    mercurial \
    reprepro \
    ruby1.9.1 \
    ruby1.9.1-dev \
    s3cmd=1.1.* \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*
