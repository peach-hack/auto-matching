#!/usr/bin/env bash

# reset
heroku pg:reset DATABASE_URL --app auto-matching-api-rails

# migrate
heroku run rails ridgepole:apply --app auto-matching-api-rails

# seed
heroku run rails db:seed_fu --app auto-matching-api-rails
