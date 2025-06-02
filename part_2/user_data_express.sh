#!/bin/bash
apt update -y
apt install -y nodejs npm git
cd /home/ubuntu
git clone https://github.com/TahaGhadiali/Assignment_5
cd assignment_5/backend
npm install
nohup node app.js > /home/ubuntu/assignment_5/backend.log 2>&1 &
