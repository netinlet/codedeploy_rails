#!/bin/bash -ex

echo Configuring Rails

sudo yum -y install sqlite-devel

HOME_DIR=/home/ec2-user
DEPLOY_DIR=$HOME_DIR/apps/codedeploy_rails

. $HOME_DIR/.bash_profile

rbenv rehash

cd $DEPLOY_DIR

bundle install

bundle exec rake assets:precompile
