#!/usr/bin/env bash

source bin/common.sh

exec_in_rails bundle
exec_in_nuxt yarn

docker-compose run rails bundle
docker-compose run worker bundle
docker-compose run nuxt yarn
