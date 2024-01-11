#!/bin/bash
echo "Installing dependencies..."
sudo apt update
sudo apt install -y wget apt-transport-https software-properties-common
source /etc/os-release
echo "Downloading MS packages..."
wget -q https://packages.microsoft.com/config/ubuntu/$VERSION_ID/packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb
rm packages-microsoft-prod.deb
echo "Installing dotnet and powershell..."
sudo apt update
sudo apt install -y dotnet-sdk-8.0 aspnetcore-runtime-8.0
echo "Installing powershell from GitHub release"
wget https://github.com/PowerShell/PowerShell/releases/download/v7.4.0/powershell_7.4.0-1.deb_amd64.deb
sudo dpkg -i powershell_7.4.0-1.deb_amd64.deb
rm powershell_7.4.0-1.deb_amd64.deb
echo "Done."