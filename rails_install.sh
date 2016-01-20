#!/bin/bash
#run me with this
#bash < <(curl -sL  https://github.com/monkeySee-monkeyCode/octobot/blob/master/rails_install.sh)

set -e

echo "Adding PPA for Node.js runtime. -=SUDO=-"
sudo add-apt-repository ppa:chris-lea/node.js

echo "Updates packages. -=SUDO=-"
sudo apt-get update

echo "Installs packages. -=SUDO=-"
sudo apt-get --ignore-missing install build-essential git-core curl openssl libssl-dev libcurl4-openssl-dev zlib1g zlib1g-dev libreadline-dev libreadline6 libreadline6-dev libyaml-dev libsqlite3-dev libsqlite3-0 sqlite3 libxml2-dev libxslt1-dev python-software-properties libffi-dev libgdm-dev libncurses5-dev automake autoconf libtool bison postgresql postgresql-contrib libpq-dev pgadmin3 libc6-dev nodejs -y

echo "Installs ImageMagick for image processing -=SUDO=-"
sudo apt-get install imagemagick --fix-missing

echo "Installs RVM (Ruby Version Manager)"
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
curl -sSL https://get.rvm.io | bash -s stable
source ~/.rvm/scripts/rvm

echo "Installs Ruby"
rvm install 2.2.2
rvm use 2.2.2 --default

echo "gem: --no-ri --no-rdoc" > ~/.gemrc
gem install bundler
gem install rails

echo -e "\n- - - - - -\n"
echo -e "Version Check"


echo -n "Should be sqlite 3.8.1 or higher: sqlite "
sqlite3 --version
echo -n "Should be rvm 1.26.11 or higher:         "
rvm --version | sed '/^.*$/N;s/\n//g' | cut -c 1-11
echo -n "Should be ruby 2.2.2:                "
ruby -v | cut -d " " -f 2
echo -n "Should be Rails 4.2.1 or higher:         "
rails -v
echo -e "\n- - - - - -\n"

echo "Insallation possibly successful"

source ~/.rvm/scripts/rvm 
cd ~
rails new canary
cd /canary
bundle install
rails server

