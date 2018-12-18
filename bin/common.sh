#!/usr/bin/env bash

function exec_in_rails () {
  cd auto-matching-api-rails
  $@
  cd ../
}

function exec_in_nuxt () {
  cd auto-matching-nuxt
  $@
  cd ../
}
