FROM 		google/debian:wheezy
MAINTAINER 	Robin <robin@naas.io>

ENV DEBIAN_FRONTEND noninteractive
ENV STAGE_PATH /build
ENV DEB_PATH /deb

# prepare build environment
RUN apt-get update && apt-get install -y \
	build-essential \
	zlib1g-dev \
	libpcre3 \
	libpcre3-dev \
	unzip \
	libssl-dev \
	wget \
	debhelper

ADD run.sh /usr/local/sbin/run.sh
RUN chmod +x /usr/local/sbin/run.sh

RUN mkdir ${STAGE_PATH}
RUN mkdir ${DEB_PATH}

CMD /usr/local/sbin/run.sh
