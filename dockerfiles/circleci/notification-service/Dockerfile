FROM stitchdata/circleci:16.04

# Install and configure MySQL 5.7
#
# NOTE: There is a known issue with Overlay2 and MySQL
# See https://github.com/docker/for-linux/issues/72
# A workaround is to do this before starting the mysql service:
#
# ```
# find /var/lib/mysql -type f -exec touch {} \;
# ````

ENV DEBIAN_FRONTEND noninteractive

RUN echo "mysql-server mysql-server/root_password password password" | debconf-set-selections \
    && echo "mysql-server mysql-server/root_password_again password password" | debconf-set-selections \
    && apt-get -y update \
    && apt-get -y -q install mysql-server-5.7 mysql-client \
    && usermod -d /var/lib/mysql/ mysql
