#! /bin/bash
#Log as root

#Install packages:
pacman -S git
pacman -S nodejs
pacman -S mongodb
pacman -S python2
pacman -S adduser
pacman -S gcc
pacman -S npm

#Install npm cli:
npm install -g grunt-cli
npm install -g mean-cli
npm install -g make
npm install -g bower
npm install -g node-gyp
npm install -g browserify
npm config -g set python "/usr/bin/python2"

#Create new user for nodejs and add it to wheel group
adduser 000cat
gpasswd -a 000cat wheel

#Log in as 000cat
git clone https://github.com/linnovate/mean.git
cd mean
mean install mean-admin
mean install socket
mean install upload
mean install comments
npm install
NODE_ENV=production grunt