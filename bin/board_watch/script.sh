#!/usr/bin/env bash

curl -H "Accept: application/json" -H "Content-Type: application/json" \
     -X POST -d "{ \"session\": {\"username\": \"${USERNAME}\", \"password\": \"${PASSWORD}\"}}" \
     $URL/api/session -w '\n%{http_code}\n' -c cookie -s

curl -X POST -H 'Content-Type:application/json' \
     -d "{\"ids\": [2,3,4]}" \
     $URL/api/users/posts/daily-crawl -w '\n%{http_code}\n' -s -b cookie
