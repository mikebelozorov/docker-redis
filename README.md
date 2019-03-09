# docker-redis

Redis with consul agent 

```
docker run -d \
 -e CONSUL_HOST="consul1" \
 -e CONSUL_DC="mydc" \
 -e CONSUL_SERVICE_NAME="influx" \
 mikebelozorov/docker-redis
```

Base image: [redis](https://hub.docker.com/_/redis/)

Additional available envs:

- CONSUL_HOST
- CONSUL_DC
- CONSUL_SERVICE_NAME
- CONSUL_BIND_EXPR
