FROM stitchdata/circleci:16.04

# Postgres
RUN apt-get -y install postgresql-9.5 \
	&& service postgresql start \
	&& su postgres -c "createdb root" \
	&& su postgres -c "psql -c \"alter role postgres password 'password';\"" \
	&& su postgres -c "psql -c \"create user root LOGIN password 'password' superuser;\""

# Ruby for rake migrations
# By default, /usr/local/bin/rake will not work. We need to point to the real binary
RUN apt-get -y install ruby ruby-dev \
	&& gem install pg --version '~> 0.11' \
	&& gem install activerecord --version 3.2.6 \
	&& gem install rake --version 10.0.4 \
	&& rm /usr/local/bin/rake \
	&& ln -s /var/lib/gems/2.3.0/gems/rake-10.0.4/bin/rake /usr/local/bin/rake
