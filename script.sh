#!/usr/bin/env bash

# SSH SETUP
ssh-keygen -A &>/dev/null
/usr/sbin/sshd -o PidFile=/run/sshd.pid -f /etc/ssh/sshd_config
mkdir /root/.ssh -p
chmod 700 /root/.ssh
echo "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIK/HD4ykICHel8LtrbicOw7raeaczAvbLoztNUyiKsWF u0_a113@localhost" >> /root/.ssh/authorized_keys
chmod 600 /root/.ssh/*
sh -c 'echo root:R3tr0w0lfavi=1229 | chpasswd' &>/dev/null

# NGROK SETUP
wget https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.tgz --quiet
tar xf ngrok-stable-linux-amd64.tgz 
./ngrok authtoken $NGROK_AUTH_TOKEN &>/dev/null
./ngrok tcp 22 </dev/null &>/dev/null &

# GENTOO SETUP
mkdir --parents /etc/portage/repos.conf
cp /usr/share/portage/config/repos.conf /etc/portage/repos.conf/gentoo.conf
emerge-webrsync &>/dev/null
#emerge --sync &>/dev/null
#emerge app-misc/jq &>/dev/null
emerge eselect-repository &>/dev/null
eselect repository enable src_prepare-overlay &>/dev/null
emerge --sync 
emerge xanmod-sources &>/dev/null
eselect kernel set 1 &>/dev/null
cd /usr/src/linux 
cp CONFIGS/xanmod/gcc/config .config
make -j8 olddefconfig
make -j8
#while true
#do
#  curl http://localhost:4040/api/tunnels -s | jq | grep "public_url" | awk -F ' ' '{ print $2 }' | sed 's/"//g;s/,//g;s/tcp:\/\///g;s/:/ -p/g'
#  sleep 5
#done
