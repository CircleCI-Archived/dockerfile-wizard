#!/bin/bash

##      - run: lsb_release -a
##      - run: node --version
##      - run: ruby --version
##      - run: python --version
##      - run: java -version
##      - run: mysql --version
##      - run: psql --version

##      - run: # phantomjs
##          name: verify phantomjs
##          command: Xvfb :99 -screen 0 1280x1024x24 && sleep 10
##          background: true

##      - run: phantomjs --version
##      - run: firefox --version
##      - run: google-chrome --version
##      - run: chromedriver --version

# first: lsb_release -a grep $LINUX_VERSION or sth

# test ruby
if [ ! -e $RUBY_VERSION_NUM ] ; then
  if [[ $(ruby --version | grep $RUBY_VERSION_NUM) ]] ; then
    echo "ruby is version $RUBY_VERSION_NUM"
  else
    exit 1
  fi
fi

# test node
if [ ! -e $NODE_VERSION_NUM ] ; then
  if [[ $(node --version | grep $NODE_VERSION_NUM) ]] ; then
    echo "node is version $NODE_VERSION_NUM"
  else
    exit 1
  fi
fi

# test python
if [ ! -e $PYTHON_VERSION_NUM ] ; then
  if [[ $(python --version | grep $PYTHON_VERSION_NUM) ]] ; then
    echo "python is version $PYTHON_VERSION_NUM"
  else
    exit 1
  fi
fi

# test php eventually
# if [ ! -e $PHP_VERSION_NUM ] ; then
# fi

# test java
if [ $JAVA = "true" ] ; then
fi

# test mysql
if [ $MYSQL_CLIENT = "true" ] ; then
fi

# test postgres
if [ $POSTGRES_CLIENT = "true" ] ; then
fi

# test browser tools
if [ $BROWSERS = "true" ] ; then
fi
