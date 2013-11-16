FROM ubuntu:12.10
MAINTAINER JP Simard "jp@jpsim.com"

# Update package repository
RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe multiverse" > /etc/apt/sources.list
RUN apt-get update
RUN apt-get upgrade -y

# Required packages
RUN apt-get install -y software-properties-common python python-software-properties g++ make

# Init node.js
RUN add-apt-repository -y ppa:chris-lea/node.js
RUN apt-get update
RUN apt-get install -y nodejs

# Removed unnecessary packages
RUN apt-get purge -y software-properties-common python python-software-properties g++ make
RUN apt-get autoremove -y

# Clear package repository cache
RUN apt-get clean all

# Update NPM and install forever
RUN npm -g update npm
RUN npm install -g forever

# Copy files and run
ADD . /opt/apps/node-docker
ADD .docker/run.sh /usr/local/bin/run
EXPOSE 8000
CMD ["/bin/sh", "-e", "/usr/local/bin/run"]
