#!/usr/bin/env bash

rc-service sshd start 
sh -c 'echo root:R3tr0w0lfavi=1229 | chpasswd'
ls -lah /root/
sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/g;s/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config
wget https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.tgz --quiet
tar xf ngrok-stable-linux-amd64.tgz 
./ngrok authtoken $NGROK_AUTH_TOKEN
./ngrok tcp 22 </dev/null &>/dev/null &
sleep 3
curl http://127.0.0.1:4040/api/tunnels 
sleep 25500
