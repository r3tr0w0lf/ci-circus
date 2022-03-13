#!/usr/bin/env bash

rc-service sshd start
wget https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.tgz
tar xvf ngrok-stable-linux-amd64.tgz
./ngrok authtoken $NGROK_AUTH_TOKEN
./ngrok tcp 22 </dev/null &>/dev/null & || exit 0
curl http://localhost:4040/api/tunnels -s 
sleep 25500
