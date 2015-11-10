FROM centos:centos7
MAINTAINER jgonzalez@wemanity.com

RUN yum -y update; yum clean all
RUN yum -y install http://nginx.org/packages/centos/7/noarch/RPMS/nginx-release-centos-7-0.el7.ngx.noarch.rpm; yum -y makecache
RUN yum -y install nginx-1.8.0

ENV LAST_BUILD=15-10-03-15-57

RUN rm /etc/nginx/conf.d/default.conf
RUN rm /etc/nginx/conf.d/example_ssl.conf

COPY conf/docker-registry.conf /etc/nginx/conf.d/docker-registry.conf
COPY conf/nginx.conf /etc/nginx/nginx.conf

COPY /certs/key.pem /etc/nginx/ssl/key.pem
COPY /certs/cert.pem /etc/nginx/ssl/cert.pem

EXPOSE 80

CMD ["nginx"]
