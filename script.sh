#!/usr/bin/env bash

mkdir ~/.ssh
chmod 700 ~/.ssh
echo "@cert-authority uptermd.upterm.dev,157.230.199.75 ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAICiecex8Dq718eSe1CCLgLvDmI7AagvCtax7brPFWkh4" >> ~/.ssh/known_hosts
wget https://github.com/owenthereal/upterm/releases/download/v0.7.5/upterm_linux_amd64.tar.gz
tar xvf upterm_linux_amd64.tar.gz
./upterm host -- bash
