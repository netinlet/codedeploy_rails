#!/bin/bash -ex

echo After Install Hook

gem install foreman

bundle install

bundle exec rake assets:precompile

supervisord tmp/foreman_export
