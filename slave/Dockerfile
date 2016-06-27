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
    ssh-keygen -A && \

# Change SSH port
    sed -i 's/^#Port 22.*/Port 2000/' /etc/ssh/sshd_config

EXPOSE 2000

ENTRYPOINT ["/usr/sbin/sshd", "-D"]
