#!/usr/bin/env bash

# update Ubuntu
echo "(INFO) ### Running apt-get update ###"
sudo apt-get update 1> /dev/null
echo "(INFO) ### Running apt-get upgrade ###"
sudo apt-get -y upgrade 1> /dev/null

# install git
"(INFO) ### Installing git... ###"
sudo apt-get install -y git-core
if [ $? -eq 0 ] 
then 
	echo "(INFO) ### Git installed correctly ###"
else
	echo "(EE) ===>  GIT FAILED <==="
fi

# install heroku
echo "(INFO) ### Installing heroku... ###"
wget -qO- https://toolbelt.heroku.com/install-ubuntu.sh | sh 1> /dev/null
if [ $? -eq 0 ] 
then 
	echo "(INFO) ### Heroku installed correctly ###"
else
        echo "(EE) ===> HEROKU FAILED <==="
fi

# install node.js
echo "(INFO) ### Adding node.js ppa ###"
sudo add-apt-repository  -y ppa:chris-lea/node.js
sudo apt-get update 1> /dev/null
echo "(INFO) ### installing node.js... ###"
sudo apt-get install -y nodejs 1> /dev/null
if [ $? -eq 0 ]
then 
	echo "(INFO) ### Node.js installed correctly ###"
else
        echo "(EE) ===> NODE.JS FAILED <==="
fi

# install some npm modules
echo "(INFO) ### adding node modules... ###"
npm install restler csv accounting 1> /dev/null

echo "git have been installed in `which git`"
echo "heroku have been installed in `which heroku`"
echo "node.js have been installed in `which node`"
echo "npm have been installed in `which npm`"

# login to heroku
heroku login
