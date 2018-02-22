FROM debian:jessie-slim

RUN apt-get update \
  && apt-get install -y --no-install-recommends \
    wget \
    lsb-release \
  && wget http://repo.percona.com/apt/percona-release_0.1-4.$(lsb_release -sc)_all.deb \
  && dpkg -i percona-release_0.1-4.$(lsb_release -sc)_all.deb \
  && rm -f percona-release_0.1-4.$(lsb_release -sc)_all.deb \
  && apt-get update \
  && apt-get install pmm-client \
  && rm -rf /var/lib/apt/lists/* /tmp/*

COPY docker-entrypoint.sh /usr/local/bin/

WORKDIR /usr/local/percona/pmm-client

ENTRYPOINT ["docker-entrypoint.sh"]