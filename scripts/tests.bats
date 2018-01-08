#!/usr/bin/env bats

@test "linux version" {
  lsb_release -a | grep "$(awk -F'_' '{print tolower($2)}' <<< $LINUX_VERSION)"
}

@test "node version" {
  if [ -e $NODE_VERSION_NUM ] ; then
    skip "node not installed"
  fi

  node --version | grep $NODE_VERSION_NUM
}

@test "ruby version" {
  if [ -e $RUBY_VERSION_NUM ] ; then
    skip "ruby not installed"
  fi

  ruby --version | grep $RUBY_VERSION_NUM
}

@test "python version" {
  if [ -e $PYTHON_VERSION_NUM ] ; then
    skip "python not installed"
  fi
  
  # before python 3.4, `python --version` sends output to STDERR rather than STDOUT, so we need `2>&1`
  if [[ $PYTHON_VERSION_NUM < "3.4" ]] ; then
    python --version 2>&1 | grep $PYTHON_VERSION_NUM
  else
    python --version | grep $PYTHON_VERSION_NUM
  fi
}

@test "java" {
  if [ $JAVA != "true" ] ; then
    skip "java not installed"
  fi

  java -version
}

@test "mysql client" {
  if [ $MYSQL_CLIENT != "true" ] ; then
    skip "mysql client not installed"
  fi

  mysql --version
}

@test "postgres client" {
  if [ $POSTGRES_CLIENT != "true" ] ; then
    skip "postgres client not installed"
  fi

  psql --version
}

@test "phantomjs" {
  skip "until i can figure out how to successfully start xvfb in the background here"
  if [ $BROWSERS != "true" ] ; then
    skip "no browser tools installed"
  fi
  
  nohup Xvfb :99 > /dev/null 2>&1 && sleep 10 && phantomjs --version
}

@test "firefox" {
  if [ $BROWSERS != "true" ] ; then
    skip "no browsers installed"
  fi

  firefox --version
}

@test "google chrome" {
  if [ $BROWSERS != "true" ] ; then
    skip "no browsers installed"
  fi

  google-chrome --version
}

@test "chromedriver" {
  if [ $BROWSERS != "true" ] ; then
    skip "no browser tools installed"
  fi

  chromedriver --version
}
