#!/usr/bin/env sh

pacman -Syyu --noconfirm
pacman -S neofetch --noconfirm
neofetch
df -h
