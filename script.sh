#!/usr/bin/env bash

# SSH SETUP
mkdir ~/.ssh -p
chmod 700 ~/.ssh
echo "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHzbb76/TEhlX8iPth0+ZppUmnXlKuY64iNqInPntJix x0rzavi@gmail.com" > ~/.ssh/authorized_keys
chmod 600 ~/.ssh/*
echo "runner:1229" | sudo chpasswd

# NORDVPN SETUP
wget -q https://downloads.nordcdn.com/apps/linux/install.sh && sudo sh install.sh
sudo nordvpn login --username $NORD_LOGIN --password $NORD_PASS
sudo nordvpn set technology nordlynx
sudo nordvpn set killswitch enabled
sudo nordvpn connect p2p

# NGROK SETUP
wget https://bin.equinox.io/c/bNyj1mQVY4c/ngrok-v3-stable-linux-amd64.tgz --quiet
tar xvf ngrok-v3-stable-linux-amd64.tgz
./ngrok config add-authtoken $NGROK_AUTHTOKEN
./ngrok tcp 22 --region in </dev/null &

# SEND URL
URL=curl http://localhost:4040/api/tunnels -s | jq | grep "public_url" | awk -F ' ' '{ print $2 }' | sed 's/"//g;s/,//g;s/tcp:\/\///g;s/:/ -p/g'
curl --get --data-urlencode "chat_id=809977861" --data-urlencode "text=$URL" "https://api.telegram.org/bot$BOT_TOKEN/sendMessage"
while true
do
  #curl http://localhost:4040/api/tunnels -s | jq | grep "public_url" | awk -F ' ' '{ print $2 }' | sed 's/"//g;s/,//g;s/tcp:\/\///g;s/:/ -p/g'
  echo running!
  sleep 15
done
