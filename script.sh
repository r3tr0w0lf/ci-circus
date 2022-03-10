#!/usr/bin/env bash

wget https://github.com/owenthereal/upterm/releases/download/v0.7.5/upterm_linux_amd64.tar.gz
tar xvf upterm_linux_amd64.tar.gz
echo "yes" | ./upterm host -- zsh
