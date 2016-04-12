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
RUN groupadd docker && \
    usermod -a -G docker jenkins && \
    groupmod -g 127 docker
USER jenkins

RUN echo "jenkins" | id
