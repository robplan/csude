#!/bin/ash

set -e
rm -f /usr/src/app/tmp/pids/server.pid
rm -f /usr/src/app/tmp/ready.txt
rm -f /usr/src/app/.overmind.sock
bundle install && bundle binstubs --all --path=$BUNDLE_BIN
bin/rails db:create
bin/rails db:environment:set RAILS_ENV=development
bin/rails db:drop db:create db:schema:load db:seed
touch tmp/ready.txt

exec "$@"
