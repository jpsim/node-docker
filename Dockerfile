FROM ubuntu:12.10
MAINTAINER JP Simard "jp@jpsim.com"

# Update packages
RUN apt-get update && apt-get upgrade

# Install some packages we need
RUN apt-get install -y curl

# Install Node.JS
RUN cd /usr/local && curl http://nodejs.org/dist/v0.10.22/node-v0.10.22-linux-x64.tar.gz | tar --strip-components=1 -zxf- && cd
RUN npm -g update npm
RUN npm install -g forever

# Copy files and run
ADD . /opt/apps/node-docker
RUN cd /opt/apps/node-docker && npm install
EXPOSE 8000
CMD forever /opt/apps/node-docker/app.js
