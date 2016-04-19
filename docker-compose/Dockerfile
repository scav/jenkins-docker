#########################################################
#                                                       #
#           Compose project tester for jenkins          #
# 							                            #
#########################################################
FROM alpine
MAINTAINER Dag Heradstveit <dagherad@gmail.com>

ENV	GRADLE_VERSION	2.10
ENV	GRADLE_HOME /opt/gradle
ENV	PATH $PATH:$GRADLE_HOME/bin

# Install dependencies
RUN apk --update upgrade --no-cache && apk add libstdc++ bash git openjdk8 curl docker py-pip && \

# Upgrade pip and Install docker compose
	pip install --upgrade pip && \
    pip install docker-compose 