#! /bin/bash

redis-commander --redis-host $REDIS_PORT_6379_TCP_ADDR --redis-port $REDIS_PORT_6379_TCP_PORT --port 8080 --http-u "${COMMANDER_USER}" --http-p "${COMMANDER_USER_PWD}"
