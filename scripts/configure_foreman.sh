#!/bin/bash -ex

echo Configuring Foreman

# TODO  this needs to be unhardcoded
#HOME_DIR=/home/ec2-user
DEPLOY_DIR=$HOME/apps/codedeploy_rails

. $HOME/.bash_profile
rbenv rehash

gem install io-console
gem install foreman
rbenv rehash

mkdir -p $HOME/log

foreman export -f $DEPLOY_DIR/Procfile --app=r3 --env=$DEPLOY_DIR/env.production --log=$HOME/log --port 3000 --user=ec2-user supervisord $HOME/etc/supervisor.d
