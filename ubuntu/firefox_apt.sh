#!/bin/bash
echo "Removing firefox snap..."
sudo snap remove firefox
echo "Adding Mozilla's ppa..."
sudo add-apt-repository -y ppa:mozillateam/ppa
echo "Updating packages priority..."
echo '
Package: *
Pin: release o=LP-PPA-mozillateam
Pin-Priority: 1001
' | sudo tee /etc/apt/preferences.d/mozilla-firefox
echo "Enabling update for future releases..."
echo 'Unattended-Upgrade::Allowed-Origins:: "LP-PPA-mozillateam:${distro_codename}";' | sudo tee /etc/apt/apt.conf.d/51unattended-upgrades-firefox
echo "Installing Firefox from APT..."
sudo apt update
sudo apt install -y firefox
echo "Done"
