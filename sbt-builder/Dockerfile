#########################################################
#                                                       #
#           SBT project builder for jenkins             #
#               http://www.scala-sbt.org/               #
# 							                            #
#########################################################
FROM alpine
MAINTAINER Dag Heradstveit <dagherad@gmail.com>

ENV SBT_VERSION 0.13.11
ENV SBT_HOME /opt/sbt

# Install dependencies
RUN apk --update upgrade --no-cache && apk add libstdc++ bash git openjdk8 wget docker

# Install sbt
RUN wget https://dl.bintray.com/sbt/native-packages/sbt/0.13.11/sbt-${SBT_VERSION}.zip && \
mkdir -p /opt/ && \
cd /opt/ && \
    unzip /sbt-${SBT_VERSION}.zip && \
  	ln -s /opt/sbt/bin/sbt /usr/bin/sbt && \
	rm -f sbt-${SBT_VERSION}.zip && \
    sbt