#!/usr/bin/env bash

# SSH SETUP
mkdir ~/.ssh -p
chmod 700 ~/.ssh
echo "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHzbb76/TEhlX8iPth0+ZppUmnXlKuY64iNqInPntJix x0rzavi@gmail.com" > ~/.ssh/authorized_keys
chmod 600 ~/.ssh/*
echo "runner:1229" | sudo chpasswd 

# NGROK SETUP
wget https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.tgz --quiet
tar xvf ngrok-stable-linux-amd64.tgz
./ngrok config add-authtoken $NGROK_AUTHTOKEN
./ngrok tcp 22 </dev/null &

# SHOW URL
while true
do
  curl http://localhost:4040/api/tunnels -s | jq | grep "public_url" | awk -F ' ' '{ print $2 }' | sed 's/"//g;s/,//g;s/tcp:\/\///g;s/:/ -p/g'
  sleep 5
done
