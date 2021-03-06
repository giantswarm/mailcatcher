FROM debian:jessie-slim

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -q \
  && apt-get install -q -y --no-install-recommends \
    libsqlite3-dev ruby ruby-dev build-essential \
  && gem install --no-ri --no-rdoc mailcatcher \
  && apt-get remove -y build-essential \
  && apt-get autoremove -y \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists

EXPOSE 1080 1025

ENTRYPOINT ["mailcatcher", "--smtp-ip=0.0.0.0", "--http-ip=0.0.0.0", "--foreground"]
