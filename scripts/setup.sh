#!/bin/sh

echo "CircleCI Docker Wizard"

read -r -p "
Name your image (no spaces please!): " IMAGE_NAME

perl -i -pe "s/# name your image \(no spaces please!\)/$IMAGE_NAME/" .circleci/config.yml
perl -i -pe "s/\(name of image\)/$IMAGE_NAME/" .circleci/config.yml

read -r -p "
Give your image a tag (no spaces please!): " IMAGE_TAG

perl -i -pe "s/# give your image a tag \(no spaces please!\)/$IMAGE_TAG/" .circleci/config.yml
perl -i -pe "s/\(image tag\)/$IMAGE_TAG/" .circleci/config.yml

read -r -p "
Pick a Linux version for your image:
  1. Debian 8 (Jessie)
  2. Debian 9 (Stretch)
  3. Ubuntu 14.04 (Trusty)
  4. Ubuntu 16.04 (Xenial)
(Enter 1, 2, 3, or 4): " LINUX_VERSION

case "$LINUX_VERSION" in
  1)
    perl -i -pe 's/# DEBIAN_JESSIE, DEBIAN_STRETCH, UBUNTU_TRUSTY, or UBUNTU_XENIAL/DEBIAN_JESSIE/' .circleci/config.yml
    ;;
  2)
    perl -i -pe 's/# DEBIAN_JESSIE, DEBIAN_STRETCH, UBUNTU_TRUSTY, or UBUNTU_XENIAL/DEBIAN_STRETCH/' .circleci/config.yml
    ;;
  3)
    perl -i -pe 's/# DEBIAN_JESSIE, DEBIAN_STRETCH, UBUNTU_TRUSTY, or UBUNTU_XENIAL/UBUNTU_TRUSTY/' .circleci/config.yml
    ;;
  4)
    perl -i -pe 's/# DEBIAN_JESSIE, DEBIAN_STRETCH, UBUNTU_TRUSTY, or UBUNTU_XENIAL/UBUNTU_XENIAL/' .circleci/config.yml
    ;;
esac

read -r -p "
Pick a Ruby version from https://cache.ruby-lang.org/pub/ruby (i.e., 2.4.2, etc.), or hit enter to skip installing Ruby
: " RUBY_VERSION_NUM

if [ "$RUBY_VERSION_NUM" ] ; then
  perl -i -pe "s/# pick a version from https:\/\/cache.ruby-lang.org\/pub\/ruby/$RUBY_VERSION_NUM/" .circleci/config.yml
else
  perl -i -pe "s/RUBY_VERSION_NUM:/# RUBY_VERSION_NUM:/" .circleci/config.yml
  perl -i -pe "s/- run: ruby/# - run: ruby/" .circleci/config.yml
fi

read -r -p "
Pick a Node version from https://nodejs.org/dist, or hit enter to skip installing Node
: " NODE_VERSION_NUM

if [ "$NODE_VERSION_NUM" ] ; then
  perl -i -pe "s/# pick a version from https:\/\/nodejs.org\/dist/$NODE_VERSION_NUM/" .circleci/config.yml
else
  perl -i -pe "s/NODE_VERSION_NUM:/# NODE_VERSION_NUM:/" .circleci/config.yml
  perl -i -pe "s/- run: node/# - run: node/" .circleci/config.yml
fi

read -r -p "
Pick a Python version from https://python.org/ftp/python, or hit enter to skip installing Python
: " PYTHON_VERSION_NUM

if [ "$PYTHON_VERSION_NUM" ] ; then
  perl -i -pe "s/# pick a version from https:\/\/python.org\/ftp\/python/$PYTHON_VERSION_NUM/" .circleci/config.yml
else
  perl -i -pe "s/PYTHON_VERSION_NUM:/# PYTHON_VERSION_NUM:/" .circleci/config.yml
  perl -i -pe "s/- run: python/# - run: python/" .circleci/config.yml
fi

read -r -p "
Do you need Java in your image? Enter the word 'yes' to install Java 8 or hit enter to skip installing Java
: " JAVA

case "$JAVA" in
  yes)
    perl -i -pe 's/# Java options: true, false/true/' .circleci/config.yml
    ;;
  *)
    perl -i -pe 's/# Java options: true, false/false/' .circleci/config.yml
    perl -i -pe "s/- run: java/# - run: java/" .circleci/config.yml
    ;;
esac

read -r -p "
Does your project need MySQL? Enter the word 'yes' to install the MySQL database client or hit enter to skip installing the MySQL client
: " MYSQL

case "$MYSQL" in
  yes)
    perl -i -pe 's/# MySQL options: true, false/true/' .circleci/config.yml
    ;;
  *)
    perl -i -pe 's/# MySQL options: true, false/false/' .circleci/config.yml
    perl -i -pe "s/- run: mysql/# - run: mysql/" .circleci/config.yml
    ;;
esac

read -r -p "
Does your project need Postgres? Enter the word 'yes' to install the Postgres database client or hit enter to skip installing the Postgres client
: " POSTGRES

case "$POSTGRES" in
  yes)
    perl -i -pe 's/# Postgres options: true, false/true/' .circleci/config.yml
    ;;
  *)
    perl -i -pe 's/# Postgres options: true, false/false/' .circleci/config.yml
    perl -i -pe "s/- run: psql/# - run: psql/" .circleci/config.yml
    ;;
esac

read -r -p "
Does your project need Dockerize? Enter the word 'yes' to install Dockerize or hit enter to skip installing Dockerize
: " DOCKERIZE

case "$DOCKERIZE" in
  yes)
    perl -i -pe 's/# Dockerize options: true, false/true/' .circleci/config.yml
    ;;
  *)
    perl -i -pe 's/# Dockerize options: true, false/false/' .circleci/config.yml
    perl -i -pe "s/- run: dockerize/# - run: dockerize/" .circleci/config.yml
    ;;
esac

read -r -p "
Does your project need Heroku CLI? Enter the word 'yes' to install Heroku CLI or hit enter to skip installing Heroku CLI
: " HEROKU_CLI

case "$HEROKU_CLI" in
  yes)
    perl -i -pe 's/# Heroku CLI options: true, false/true/' .circleci/config.yml
    ;;
  *)
    perl -i -pe 's/# Heroku CLI options: true, false/false/' .circleci/config.yml
    perl -i -pe "s/- run: heroku/# - run: heroku/" .circleci/config.yml
    ;;
esac

read -r -p "
Does your project need web browsers for browser testing? Enter the word 'yes' to install browsers/tools (Xvfb, PhantomJS, Firefox, Chrome, Chromedriver) or hit enter to skip
: " BROWSERS

case "$BROWSERS" in
  yes)
    perl -i -pe 's/# browser tools \(Xvfb, PhantomJS, Firefox, Chrome, Chromedriver\): true, false/true/' .circleci/config.yml
    ;;
  *)
    perl -i -pe 's/# browser tools \(Xvfb, PhantomJS, Firefox, Chrome, Chromedriver\): true, false/false/' .circleci/config.yml
    perl -i -pe "s/- run: # phantomjs/# - run: # phantomjs/" .circleci/config.yml
    perl -i -pe "s/name: verify phantomjs/# name: verify phantomjs/" .circleci/config.yml
    perl -i -pe "s/command: Xvfb/# command: Xvfb/" .circleci/config.yml
    perl -i -pe "s/background: true/# background: true/" .circleci/config.yml
    perl -i -pe "s/- run: phantomjs/# - run: phantomjs/" .circleci/config.yml
    perl -i -pe "s/- run: firefox/# - run: firefox/" .circleci/config.yml
    perl -i -pe "s/- run: google-chrome/# - run: google-chrome/" .circleci/config.yml
    perl -i -pe "s/- run: chromedriver/# - run: chromedriver/" .circleci/config.yml
    ;;
esac

echo "
Your config.yml is done! Push your changes to GitHub to start building your docker image on CircleCI
"
