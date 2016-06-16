#!/bin/bash -ex

echo Configuring Foreman

echo $USER
echo $(env)

gem install io-console
gem install foreman
rbenv rehash

foreman export --port 3000 --user=ec2-user supervisord tmp/foreman_export

sudo mkdir -p /var/log/app
sudo mkdir -p /etc/supervisor.d
sudo cp tmp/foreman_export/*.conf /etc/supervisor.d/
