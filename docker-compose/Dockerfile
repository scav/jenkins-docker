#########################################################
#                                                       #
#           Compose project tester for jenkins          #
# 							                            #
#########################################################
FROM alpine
MAINTAINER Dag Heradstveit <dagherad@gmail.com>

# Install dependencies
RUN apk --update upgrade --no-cache && apk add docker py-pip && \

# Upgrade pip and Install docker compose
	pip install --upgrade pip && \
    pip install docker-compose 