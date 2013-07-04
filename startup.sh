#!/usr/bin/env bash

# update Ubuntu
echo "(INFO) ### Running apt-get update ###"
sudo apt-get update 1> /dev/null
echo "(INFO) ### Running apt-get upgrade ###"
sudo apt-get -y upgrade 1> /dev/null

# install heroku
echo "(INFO) ### Installing heroku... ###"
wget -qO- https://toolbelt.heroku.com/install-ubuntu.sh | sh 1> /dev/null

echo "(INFO) ### running https://raw.github.com/startup-class/setup/master/setup.sh... ###"
wget -qO- https://raw.github.com/startup-class/setup/master/setup.sh | sh 1> /dev/null

# install some npm modules
echo "(INFO) ### adding node modules... ###"
npm install restler csv accounting 1> /dev/null

echo "git have been installed in `which git`"
echo "heroku have been installed in `which heroku`"
echo "node.js have been installed in `which node`"
echo "nvm have been installed in `which nvm`"
echo "npm have been installed in `which npm`"
echo "emacs have been installed in `which emacs`"

# login to heroku
heroku login
