#!/bin/bash

set -ex

# Unpack and install node/npm
rpm -i https://github.com/bucharest-gold/node-rpm/releases/download/v${NODE_VERSION}/rhoar-nodejs-${NODE_VERSION}-1.el7.x86_64.rpm
rpm -i https://github.com/bucharest-gold/node-rpm/releases/download/v${NODE_VERSION}/npm-5.4.2-1.${NODE_VERSION}.1.el7.x86_64.rpm

# Install yarn
npm install -g yarn -s &>/dev/null

# Fix permissions for the npm update-notifier
#chmod -R 777 /opt/app-root/src/.config

# Delete NPM things that we don't really need (like tests) from node_modules
find /usr/local/lib/node_modules/npm -name test -o -name .bin -type d | xargs rm -rf

# Clean up the stuff we downloaded
rm -rf ~/.npm ~/.node-gyp ~/.gnupg /usr/share/man /tmp/* /usr/local/lib/node_modules/npm/man /usr/local/lib/node_modules/npm/doc /usr/local/lib/node_modules/npm/html
