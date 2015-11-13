FROM docker-registry:5000/nginx
MAINTAINER Julien Garcia Gonzalez <jgonzalez@wemanity.com>

RUN rm /etc/nginx/conf.d/default.conf

COPY conf/jenkins.conf /etc/nginx/conf.d/jenkins.conf
COPY conf/nginx.conf /etc/nginx/nginx.conf
