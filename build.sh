#!/bin/bash

aria2c -x16 https://github.com/tmate-io/tmate/releases/download/2.4.0/tmate-2.4.0-static-linux-amd64.tar.xz
tar xvf tmate*
./tmate*/tmate -F

