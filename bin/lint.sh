#!/usr/bin/env bash

source bin/common.sh

exec_in_rails rubocop
exec_in_nuxt yarn eslint
