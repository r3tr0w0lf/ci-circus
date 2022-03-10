#!/usr/bin/env bash

rc-service start sshd
wget https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.tgz
tar xvf ngrok-stable-linux-amd64.tgz
./ngrok authtoken $NGROK_AUTH_TOKEN
./ngrok tcp 22 &
python -m pip install requests
python tunnel_info.py
sleep 25500
