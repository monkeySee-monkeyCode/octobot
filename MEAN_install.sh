#!/bin/bash
#
#

set -e

#
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10

echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' | sudo tee /etc/apt/sources.list.d/mongodb.list


sudo apt-get update
sudo apt-get --ignore-missing install mongodb-org git build-essential openssl libssl-dev pkg-config

cd ~
wget http://nodejs.org/dist/v0.10.33/node-v0.10.33.tar.gz

tar xzvf node-v*
cd node-v*
./configure
make
sudo make install
cd ~
rm -rf ~/node-v*

sudo npm install -g bower grunt-cli
sudo git clone https://github.com/meanjs/mean.git /opt/mean

cd /opt/mean
sudo npm install

sudo bower --allow-root --config.interactive=false install

cd /opt/mean
grunt




