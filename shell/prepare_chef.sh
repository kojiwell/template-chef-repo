#/bin/bash

sudo apt-get -y install curl
echo 'export rvm_prefix="$HOME"' > /root/.rvmrc
echo 'export rvm_path="$HOME/.rvm"' >> /root/.rvmrc
\curl -sSL https://get.rvm.io | bash -s stable
source $HOME/.rvm/scripts/rvm
rvm install 2.1.1
rvm use 2.1.1 --default
gem install --no-ri --no-rdoc chef knife-solo berkshelf serverspec
