#########################################################
#                                                       #
#  Simple image to provide Jenkins with a slave node.   #
# 							                            #
#########################################################
FROM alpine
MAINTAINER Dag Heradstveit <dagherad@gmail.com>

ARG DOCKERGID
ARG DOCKERGNAME

RUN addgroup -g $DOCKERGID $DOCKERGNAME && \
    addgroup -g 1000 jenkins && \

# Install dependencies
    apk upgrade --update --no-cache && apk add libstdc++ bash git openssh openjdk8 docker && \

# Disable root, add jenkins user and create ssh key
    passwd -d root && \      
    adduser -D -s /bin/ash jenkins -h /var/jenkins_home -G $DOCKERGNAME && \
    echo "jenkins:jenkins" | chpasswd && \
    chown -R jenkins /var/jenkins_home && \	
    ssh-keygen -A
    
EXPOSE 22

ENTRYPOINT ["/usr/sbin/sshd", "-D"]
