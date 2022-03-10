#!/usr/bin/env bash

rc-service start sshd
wget https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.tgz
tar xvf ngrok-stable-linux-amd64.tgz
./ngrok authtoken $NGROK_AUTH_TOKEN
./ngrok tcp 22 </dev/null &>/dev/null &
curl http://localhost:4040/api/tunnels -s | jq | grep "public_url" | awk -F ' ' '{ print $2 }' | sed 's/"//g' | sed 's/,//g'   
sleep 25500
