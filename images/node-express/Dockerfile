FROM node:4.2.3-slim
MAINTAINER Julien Garcia Gonzalez

RUN apt-get update && apt-get install -y \
              git \
              && rm -rf /var/cache/apt/*

RUN npm install -g express-generator express-livereload
WORKDIR /src
ENTRYPOINT ["bash"]