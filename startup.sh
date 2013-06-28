#!/usr/bin/env bash

# update Ubuntu
echo "Running apt-get update"
sudo apt-get update 1> /dev/null
echo "Running apt-get upgrade"
sudo apt-get -y upgrade 1> /dev/null

# install git
"Installing git..."
sudo apt-get install -y git-core
if [ $? -eq 0 ] 
then 
	echo "git installed correctly"
else
	echo "(EE): git failed"
fi

# install heroku
echo "Installing heroku..."
wget -qO- https://toolbelt.heroku.com/install-ubuntu.sh | sh 1> /dev/null
if [ $? -eq 0 ] 
then 
        echo "heroku installed correctly"
else
        echo "(EE): heroku failed"
fi

# login to heroku
heroku login

# install node.js
echo "Adding node.js ppa"
sudo add-apt-repository ppa:chris-lea/node.js
sudo apt-get update 1> /dev/null
echo "installing node.js..."
sudo apt-get install -y nodejs 1> /dev/null
if [ $? -eq 0 ]
then 
        echo "node.js installed correctly"
else
        echo "(EE): node.js failed"
fi

# install some npm modules
echo "adding node modules..."
npm install restler csv accounting 1> /dev/null

echo "git have been installed in `which git`"
echo "heroku have been installed in `which heroku`"
echo "node.js have been installed in `which node`"
echo "npm have been installed in `which npm`"
