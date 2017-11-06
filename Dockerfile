FROM buildpack-deps:jessie
RUN if [ $(grep 'VERSION_ID="8"' /etc/os-release) ] ; then \
    echo "deb http://ftp.debian.org/debian jessie-backports main" >> /etc/apt/sources.list && \
    apt-get update && apt-get -y install -t jessie-backports phantomjs \
; elif [ $(grep 'VERSION_ID="9"' /etc/os-release) ] ; then \
		apt-get update && apt-get -y install phantomjs \
; elif [ $(grep 'VERSION_ID="14.04"' /etc/os-release) ] ; then \
		apt-get update && apt-get -y install phantomjs \
; elif [ $(grep 'VERSION_ID="16.04"' /etc/os-release) ] ; then \
    apt-get update && apt-get -y install phantomjs \
; fi
RUN apt-get -y install lsb-release