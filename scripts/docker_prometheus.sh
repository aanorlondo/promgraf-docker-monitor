#!/bin/bash

# prepare
source prepare_env.sh

# clean
docker rm -f PROMETHEUS-LOCAL
docker rmi -f negan/prometheus:local

# build
docker build -t negan/prometheus:local -f ../Dockerfile.prometheus ../
docker push negan/prometheus:local

# run
docker run \
    -d \
    -e SELF_HOSTNAME=${SELF_HOSTNAME} \
    -e DOCKER_HOSTNAME=${DOCKER_HOSTNAME} \
    -p 9090:9090 \
    --name PROMETHEUS-LOCAL \
    negan/prometheus:local