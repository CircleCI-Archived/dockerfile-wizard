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

# before python 3.4, `python --version` sends output to STDERR rather than STDOUT, so we need `2>&1`

@test "python version" {
  if [ -e $PYTHON_VERSION_NUM ] ; then
    skip "python not installed"
  fi

  if [[ $PYTHON_VERSION_NUM < "3.4" ]] ; then
    if [[ $PYTHON_VERSION_NUM < "3" ]] ; then
      python --version 2>&1 | grep $PYTHON_VERSION_NUM
    else
      python3 --version 2>&1 | grep $PYTHON_VERSION_NUM
    fi
  else
    python3 --version | grep $PYTHON_VERSION_NUM
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

@test "dockerize" {
  if [ $DOCKERIZE != "true" ] ; then
    skip "dockerize not installed"
  fi

  dockerize --version
}


@test "heroku cli" {
  if [ $HEROKU_CLI != "true" ] ; then
    skip "heroku cli not installed"
  fi

  heroku --version
}

@test "phantomjs" {
  if [ $BROWSERS != "true" ] ; then
    skip "no browser tools installed"
  fi

  phantomjs --version
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
