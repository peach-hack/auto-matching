#!/usr/bin/env bash

curl -H "Accept: application/json" -H "Content-Type: application/json" \
     -X POST -d "{ \"session\": {\"username\": \"${USERNAME}\", \"password\": \"${PASSWORD}\"}}" \
     $URL/api/session -w '\n%{http_code}\n' -c cookie -s

curl -X POST -H 'Content-Type:application/json' \
     -d "{\"ids\": [2,3,4], \"debug\": true }" \
     $URL/api/users/posts/manual-posts -w '\n%{http_code}\n' -s -b cookie
