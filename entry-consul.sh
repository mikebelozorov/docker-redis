#!/bin/sh

if [ -z $CONSUL_HOST ]; then
    echo "CONSUL_HOST is empty"
    exit 1
fi

cp /etc/consul.tpl.json /etc/consul.json
/usr/local/bin/ep /etc/consul.json
ret=$?
if [ $ret != 0 ]; then
    echo "envplate failed, some env vars not set"
    exit 1
fi
/usr/local/bin/consul agent \
    -retry-join $CONSUL_HOST \
    -bind "{{ $CONSUL_BIND_EXPR }}" \
    -datacenter $CONSUL_DC \
    -domain $CONSUL_DOMAIN \
    -config-file /etc/consul.json &

exec docker-entrypoint.sh "$@"
