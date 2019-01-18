#!/usr/bin/env bash
docker run --rm -v ${PWD}:/local swaggerapi/swagger-codegen-cli generate \
    -i ./local/swagger.yaml \
    -l swagger \
    -o ./local/tmp

cp tmp/swagger.json swagger.json

node auto-matching-nuxt/src/plugins/swagger-codegen.js

sed -i'' -e 's/let domain = '\'''\''/let domaim = process.env.baseUrl/g' auto-matching-nuxt/src/plugins/api.js
rm auto-matching-nuxt/src/plugins/api.js-e