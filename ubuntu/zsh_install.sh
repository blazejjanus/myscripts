#!/bin/bash
echo "Checking dependencies..."
if ! command -v pwsh &> /dev/null
then
   echo "Installing PowerShell..."
   bash dotnet_install.sh
fi
echo "Installing zsh"
sudo apt update
sudo apt install -y zsh
echo "Setting up zsh as default shell"
chsh -s $(which zsh)
sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
echo "Setting up oh-my-zsh theme"
sed -i 's/^ZSH_THEME=.*/ZSH_THEME="steeef"/' ~/.zshrc
echo "Creating Repos directory"
mkdir -p ~/Repos
cd ~/Repos
echo "Installing powerline fonts"
git clone https://github.com/powerline/fonts.git powerline_fonts
pwsh powerline_fonts/install.ps1
echo "Installing oh-my-zsh plugins"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/MichaelAquilina/zsh-you-should-use.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-you-should-use
echo 'plugins=(git zsh-autosuggestions zsh-syntax-highlighting zsh-you-should-use )' >> ~/.zshrc
source ~/.zshrc