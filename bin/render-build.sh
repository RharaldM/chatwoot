#!/usr/bin/env bash
set -o errexit
bundle install
yarn install
RAILS_ENV=production" bundle exec rake assets:precompile
RAILS_ENV=production" bin/rails assets:clean