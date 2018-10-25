#!/usr/bin/env bash
REDIS_CHECK=$(printf 'PING\n' | nc localhost 6379 | grep -q PONG && printf 'OK')
if [ "$REDIS_CHECK" != "OK" ]; then
    exit 1
fi