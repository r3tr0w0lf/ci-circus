#!/bin/bash

apt update
apt install curl sudo -y
curl -LO https://github.com/tmate-io/tmate/releases/download/2.4.0/tmate-2.4.0-static-linux-amd64.tar.xz
tar xf tmate*
./tmate*/tmate -F
