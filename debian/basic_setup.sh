#!/bin/bash
echo "Switching to root..."
echo "Adding sbin to PATH..."
export PATH="$PATH:/sbin:/usr/sbin:usr/local/sbin"
apt update
echo "Installing sudo..."
apt install sudo -y
usermod -aG sudo $1
echo "Installing dependencies..."
apt update
apt install -y curl wget git nano mcedit neofetch htop