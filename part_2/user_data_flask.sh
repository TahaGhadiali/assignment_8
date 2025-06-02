#!/bin/bash
apt update -y
apt install -y python3-pip git
cd /home/ubuntu
git clone https://github.com/TahaGhadiali/Assignment_5
cd assignment_5/frontend
pip3 install -r requirements.txt || pip3 install flask
nohup python3 app.py > /home/ubuntu/assignment_5/frontend.log 2>&1 &
