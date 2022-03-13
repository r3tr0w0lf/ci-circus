#!/usr/bin/env bash

ssh-keygen -A
/etc/init.d/sshd start
ps aux | grep -i sshd
sh -c 'echo root:R3tr0w0lfavi=1229 | chpasswd'
mkdir /root/.ssh -p
chmod 700 /root/.ssh
echo "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIK/HD4ykICHel8LtrbicOw7raeaczAvbLoztNUyiKsWF u0_a113@localhost" >> /root/.ssh/authorized_keys
sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/g;s/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config
wget https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.tgz --quiet
tar xf ngrok-stable-linux-amd64.tgz 
./ngrok authtoken $NGROK_AUTH_TOKEN
./ngrok tcp 22 </dev/null &>/dev/null &
sleep 3
curl http://127.0.0.1:4040/api/tunnels 
sleep 25500
