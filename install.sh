#!/bin/bash

DISTRO=$(uname --nodename)

if [[ $DISTRO == "Manjaro" ]]; then
  sudo pacman -Syu --noconfirm
  sudo pacman -S $(< arch.packages) --noconfirm
elif [[ $DISTRO == "Ubuntu" ]]; then
  sudo apt update -y
  sudo apt upgrade -y
  sudo apt install -y $(< ubuntu.packages)
fi
