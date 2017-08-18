FROM consul:0.9.2

ENV CONTAINERPILOT_VERSION='3.3.4'

RUN \
  curl -fLsS https://github.com/joyent/containerpilot/releases/download/$CONTAINERPILOT_VERSION/containerpilot-$CONTAINERPILOT_VERSION.tar.gz | \
    tar xz -C /usr/local/bin && \
  mv /usr/local/bin/docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh.orig

COPY containerpilot.json5.gotmpl /etc/
COPY docker-entrypoint.sh /usr/local/bin/

ENV \
  CONSUL_HTTP_SERVICE_NAME='consul-http' \
  CONSUL_HTTP_SERVICE_TAGS='' \
  CONTAINERPILOT='/etc/containerpilot.json5.gotmpl'
