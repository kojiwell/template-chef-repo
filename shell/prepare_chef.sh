#/bin/bash

sudo apt-get -y install curl
\curl -sSL https://get.rvm.io | bash
source $HOME/.rvm/scripts/rvm
rvm install 2.1.1
rvm use 2.1.1 --default
gem install --no-ri --no-rdoc chef knife-solo berkshelf serverspec
