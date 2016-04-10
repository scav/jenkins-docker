######################################################
# Simple image to provide Jenkins with a slave node. #
######################################################

FROM alpine
MAINTAINER Dag Heradstveit <dagherad@gmail.com>

# Install dependencies
RUN apk upgrade --update --no-cache && apk add libstdc++ bash git openssh openjdk8

# Disable root, add jenkins user and create host keys
RUN passwd -d root && \
    adduser -D -s /bin/ash jenkins && \
    #passwd -u jenkins && \
    echo "jenkins:jenkins" | chpasswd && \
    chown -R jenkins:jenkins /home/jenkins && \
    ssh-keygen -A

#RUN wget -q -O /etc/apk/keys/andyshinn.rsa.pub https://raw.githubusercontent.com/andyshinn/alpine-pkg-glibc/master/andyshinn.rsa.pub
#RUN wget https://github.com/andyshinn/alpine-pkg-glibc/releases/download/2.23-r1/glibc-2.23-r1.apk
#RUN apk add glibc-2.23-r1.apk

EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]
