#!/usr/bin/env bash

pacman -Syyu --noconfirm
pacman -S neofetch --noconfirm
neofetch
df -h
