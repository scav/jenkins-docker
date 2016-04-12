#############################################################
# Simple modification to the official jenkins image to      #
# enable jenkins to use the hosts docker.sock.              #
#                                                           #
# Be aware of the security related issues you may encounter #
# using this method.                                        #
#############################################################
FROM jenkins:2.0-beta-1
MAINTAINER Dag Heradstveit <dagherad@gmail.com>

# Become root, add jenkins to docker group, and drop back to jenkins.
USER root

# Install Docker (pipelines need this)
RUN curl -sSL https://get.docker.com/ | sh

# Make the host socket available to jenkins
RUN usermod -a -G docker jenkins && \
    groupmod -g 127 docker

# Drop back to jenkins
USER jenkins

RUN echo "jenkins" | id
