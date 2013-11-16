FROM ubuntu:12.10
MAINTAINER JP Simard "jp@jpsim.com"

# Update packages
apt-get update && apt-get upgrade

# Install some packages we need
apt-get install python-software-properties python g++ make software-properties-common

# Add node repository to sources.list and update apt
add-apt-repository ppa:chris-lea/node.js && apt-get update

# Install node.js
apt-get install nodejs

# Update NPM and install forever
RUN npm -g update npm
RUN npm install -g forever

# Copy files and run
ADD . /opt/apps/node-docker
ADD .docker/run.sh /usr/local/bin/run
EXPOSE 8000
CMD ["/bin/sh", "-e", "/usr/local/bin/run"]
