#!/bin/bash
sudo apt update -y
sudo apt install -y nodejs npm
git clone https://github.com/chapagain/nodejs-mysql-crud.git /home/ubuntu/app
cd /home/ubuntu/app
npm install
node app.js &