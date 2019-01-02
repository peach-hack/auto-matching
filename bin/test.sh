#!/usr/bin/env bash


source bin/common.sh

exec_in_rails rspec
exec_in_nuxt yarn test
