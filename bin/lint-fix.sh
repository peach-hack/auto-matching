#!/usr/bin/env bash

source bin/common.sh

exec_in_rails rubocop -a
exec_in_nuxt yarn eslint --fix
exec_in_nuxt yarn tsc

