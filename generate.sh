#!/bin/bash

echo "FROM buildpack-deps:$(awk -F'_' '{print tolower($2)}' <<< $LINUX_VERSION)"

if [ ! -e $RUBY_VERSION_NUM ] ; then
    echo "RUN wget http://ftp.ruby-lang.org/pub/ruby/$(awk -F'.' '{ print $1"."$2 }' <<< $RUBY_VERSION_NUM)/ruby-$RUBY_VERSION_NUM.tar.gz && \
    tar -xzvf ruby-$RUBY_VERSION_NUM.tar.gz && \
    cd ruby-$RUBY_VERSION_NUM/ && \
    ./configure && \
    make -j4 && \
    make install && \
    ruby -v"
fi

if [ ! -e $NODE_VERSION_NUM ] ; then
    echo "RUN wget https://nodejs.org/dist/v$NODE_VERSION_NUM/node-v$NODE_VERSION_NUM.tar.gz && \
    tar -xzvf node-v$NODE_VERSION_NUM.tar.gz && \
    rm node-v$NODE_VERSION_NUM.tar.gz && \
    cd node-v$NODE_VERSION_NUM && \
    ./configure && \
    make -j4 && \
    make install && \
    cd .. && \
    rm -r node-v$NODE_VERSION_NUM"
fi

if [ ! -e $PYTHON_VERSION_NUM ] ; then
    echo "RUN wget https://www.python.org/ftp/python/$PYTHON_VERSION_NUM/Python-$PYTHON_VERSION_NUM.tgz && \
    tar xzf Python-$PYTHON_VERSION_NUM.tgz && \
    rm Python-$PYTHON_VERSION_NUM.tgz && \
    cd Python-$PYTHON_VERSION_NUM && \
    ./configure && \
    make install"
fi

# if [ ! -e $PHP_VERSION_NUM ] ; then
#     wget "http://php.net/distributions/php-${PHP_VERSION_NUM}.tar.xz"
# fi

if [ ! -e $JAVA ] ; then
cat << EOF
RUN if [ \$(grep 'VERSION_ID="8"' /etc/os-release) ] ; then \\
    echo "deb http://ftp.debian.org/debian jessie-backports main" >> /etc/apt/sources.list && \\
    apt-get update && apt-get -y install -t jessie-backports openjdk-8-jdk ca-certificates-java \\
; elif [ \$(grep 'VERSION_ID="9"' /etc/os-release) ] ; then \\
		echo "deb http://ftp.debian.org/debian stretch-backports main" >> /etc/apt/sources.list && \\
    apt-get update && apt-get -y install -t stretch-backports openjdk-8-jdk ca-certificates-java \\
; elif [ \$(grep 'VERSION_ID="14.04"' /etc/os-release) ] ; then \\
		apt-get update && \\
    apt-get --force-yes -y install software-properties-common python-software-properties && \\
    echo | add-apt-repository -y ppa:webupd8team/java && \\
    apt-get update && \\
    echo debconf shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && \\
    echo debconf shared/accepted-oracle-license-v1-1 seen true | debconf-set-selections && \\
    apt-get -y install oracle-java8-installer \\
; elif [ \$(grep 'VERSION_ID="16.04"' /etc/os-release) ] ; then \\
    apt-get update && \\
    apt-get --force-yes -y install software-properties-common python-software-properties && \\
    echo | add-apt-repository -y ppa:webupd8team/java && \\
    apt-get update && \\
    echo debconf shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && \\
    echo debconf shared/accepted-oracle-license-v1-1 seen true | debconf-set-selections && \\
    apt-get -y install oracle-java8-installer \\
; fi
EOF
fi

if [ ! -e $MYSQL_CLIENT ] ; then
    echo "RUN apt-get -y install mysql-client"
fi

if [ ! -e $POSTGRES_CLIENT ] ; then
    echo "RUN apt-get -y install postgresql-client"
fi