#!/usr/bin/env bats

# note to self: look @ this https://engineyard.com/blog/bats-test-command-line-tools

@test "linux version" {
  lsb_release -a | grep "$(awk -F'_' '{print tolower($2)}' <<< $LINUX_VERSION)"
}

@test "node version" {
  if [ -e $NODE_VERSION_NUM ] ; then
    skip "node not installed"
  fi

  node --version | grep "$NODE_VERSION_NUM"
}

@test "ruby version" {
  if [ -e $RUBY_VERSION_NUM ] ; then
    skip "ruby not installed"
  fi

  ruby --version | grep "$RUBY_VERSION_NUM"
}

@test "python version" {
  skip "until i can figure out this weird python bug!!"
  if [ -e $PYTHON_VERSION_NUM ] ; then
    skip "python not installed"
  fi
  
  result="$(python --version)"
  [ "$result" == "Python $PYTHON_VERSION_NUM" ]
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
