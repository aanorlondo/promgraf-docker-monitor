#!/bin/bash

# prepare
source prepare_env.sh

# clean
docker rm -f GRAFANA-LOCAL

# build
docker build -t negan/grafana:local -f ../Dockerfile.grafana ../
docker push negan/grafana:local

# run
docker run \
    -d \
    -e HOSTNAME=${HOSTNAME} \
    -e GF_SERVER_HTTP_PORT=4567 \
    -p 4567:4567 \
    --name GRAFANA-LOCAL \
    negan/grafana:local