#!/bin/bash
# Update and install dependencies
apt update -y
apt install -y python3-pip nodejs npm git

# Change to home directory
cd /home/ubuntu

# Clone Flask app
git clone https://github.com/TahaGhadiali/Assignment_5
cd assignment_5/frontend
pip3 install -r requirements.txt || pip3 install flask  # fallback
nohup python3 app.py > /home/ubuntu/assignment_5/frontend.log 2>&1 &

# Clone Express app
cd /home/ubuntu
git clone https://github.com/TahaGhadiali/Assignment_5
cd assignment_5/backend
npm install
nohup node app.js > /home/ubuntu/assignment_5/backend.log 2>&1 &
