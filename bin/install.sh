#!/usr/bin/env bash

docker-compose run rails bundle
docker-compose run worker bundle
docker-compose run nuxt yarn
