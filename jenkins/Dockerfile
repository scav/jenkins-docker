#############################################################
# Simple modification to the official jenkins image to      #
# enable jenkins to use the hosts docker.sock.              #
#                                                           #
# Be aware of the security related issues you may encounter #
# using this method.                                        #
#############################################################
FROM jenkins:2.0-beta-1
MAINTAINER Dag Heradstveit <dagherad@gmail.com>

ARG DOCKERGID 
ARG DOCKERGNAME 

# Become root, add jenkins to docker group, and drop back to jenkins.
USER root

# Install Docker (for pipeline) and Docker Compose for services during builds
RUN curl -sSL https://get.docker.com/ | sh && \
    curl -L https://github.com/docker/compose/releases/download/1.7.0/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose && \
    chmod +x /usr/local/bin/docker-compose && \

# Make the host socket available to jenkins
    usermod -a -G $DOCKERGNAME jenkins && \
    groupmod -g $DOCKERGID $DOCKERGNAME

# Drop back to jenkins
USER jenkins