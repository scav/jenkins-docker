#########################################################
#                                                       #
#           Gradle project builder for jenkins          #
# 							                            #
#########################################################
FROM alpine
MAINTAINER Dag Heradstveit <dagherad@gmail.com>

ENV	GRADLE_VERSION	2.10
ENV	GRADLE_HOME /opt/gradle
ENV	PATH $PATH:$GRADLE_HOME/bin

# Install dependencies
RUN apk --update upgrade --no-cache && apk add libstdc++ bash git openjdk8 curl docker && \

# Install gradle
	curl -Lks https://services.gradle.org/distributions/gradle-${GRADLE_VERSION}-all.zip -o /root/gradle.zip && \
	mkdir -p /opt/ && \
    cd /opt/ && \
	unzip -q /root/gradle.zip && \
	ln -s gradle-${GRADLE_VERSION} gradle && \
	rm -f /root/gradle.zip