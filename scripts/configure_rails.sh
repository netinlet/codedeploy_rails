#!/bin/bash -ex

echo Configuring Rails

bundle install

bundle exec rake assets:precompile
