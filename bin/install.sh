#!/usr/bin/env bash

source bin/common.sh

docker-compose run rails bundle
docker-compose run nuxt yarn

