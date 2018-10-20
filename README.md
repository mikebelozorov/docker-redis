# docker-redis

Redis with consul agent 

```
docker run -d \
 -e CONSUL_JOIN="consul1 consul2" \
 -e CONSUL_DC="mydc" \
 -e CONSUL_SERVICE_NAME="influx" \
 mikebelozorov/docker-redis
```

Base image: [redis](https://hub.docker.com/_/redis/)

Additional available envs:

- CONSUL_JOIN
- CONSUL_DC
- CONSUL_SERVICE_NAME
