#!/usr/bin/env bash

# SSH SETUP
ssh-keygen -A
/usr/sbin/sshd -o PidFile=/run/sshd.pid -f /etc/ssh/sshd_config
mkdir /root/.ssh -p
chmod 700 /root/.ssh
echo "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHzbb76/TEhlX8iPth0+ZppUmnXlKuY64iNqInPntJix x0rzavi@gmail.com" >> /root/.ssh/authorized_keys
chmod 600 /root/.ssh/*
sh -c 'echo root:R3tr0w0lfavi=1229 | chpasswd' 

# NGROK SETUP
wget https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.tgz --quiet
tar xf ngrok-stable-linux-amd64.tgz 
./ngrok authtoken $NGROK_AUTH_TOKEN
./ngrok tcp 22 </dev/null &

# GENTOO SETUP
#mkdir --parents /etc/portage/repos.conf
#cp /usr/share/portage/config/repos.conf /etc/portage/repos.conf/gentoo.conf
#emerge-webrsync -qv
#emerge --sync -qv
emerge app-misc/jq -qv
while true
do
  curl http://localhost:4040/api/tunnels -s | jq | grep "public_url" | awk -F ' ' '{ print $2 }' | sed 's/"//g;s/,//g;s/tcp:\/\///g;s/:/ -p/g'
  sleep 5
done
