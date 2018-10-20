FROM redis:alpine

ENV CONSUL_VERSION 1.3.0

RUN apk add --no-cache ca-certificates openssl && \
    wget https://releases.hashicorp.com/consul/${CONSUL_VERSION}/consul_${CONSUL_VERSION}_linux_amd64.zip && \
    unzip -d /usr/local/bin consul_${CONSUL_VERSION}_linux_amd64.zip && \
    wget https://github.com/kreuzwerker/envplate/releases/download/v0.0.8/ep-linux -O /usr/local/bin/ep && \
    chmod +x /usr/local/bin/ep && \
    apk del openssl

COPY entry-consul.sh /usr/local/bin
COPY consul.tpl.json /etc

ENTRYPOINT [ "entry-consul.sh" ]
CMD [ "redis-server" ]
