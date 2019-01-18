#!/usr/bin/env bash
docker run --rm -v ${PWD}:/local swaggerapi/swagger-codegen-cli generate \
    -i ./local/swagger.yaml \
    -l swagger \
    -o ./local/tmp

cp tmp/swagger.json swagger.json