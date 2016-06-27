#########################################################
#                                                       #
#           NodeJS project builder for jenkins          #
#                                                       #
#########################################################
FROM alpine
MAINTAINER Dag Heradstveit <dagherad@gmail.com>

ARG DOCKERGID
ARG DOCKERGNAME

RUN apk --update upgrade --no-cache && apk add git nodejs python make g++ && \

  addgroup -g $DOCKERGID $DOCKERGNAME && \
  addgroup -g 1000 jenkins && \
  passwd -d root && \
  adduser -D -s /bin/ash jenkins -h /var/jenkins_home -G $DOCKERGNAME && \
  echo "jenkins:jenkins" | chpasswd && \
  chown -R jenkins /var/jenkins_home && \

  npm install bower -g

CMD [ "node" ]
