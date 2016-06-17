#!/bin/bash -ex

echo Application Start Hook

cd $HOME

. $HOME/.bash_profile
rbenv rehash

IFS=$'\n'; env $(cat apps/codedeploy_rails/env.production) /usr/local/bin/supervisord -c $HOME/etc/supervisord.conf
