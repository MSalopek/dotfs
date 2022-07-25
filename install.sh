#!/bin/bash

# installs tools for local development
sudo apt install build-essential -y

sudo apt install git -y

sudo apt install neovim -y

sudo apt install zsh -y
# if sudo needed: sudo chsh -s $(which zsh) msalopek  
chsh -s $(which zsh)

# oh-my-zsh
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

# oh-my-zsh plugins
git clone https://github.com/unixorn/fzf-zsh-plugin.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/fzf-zsh-plugin
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
source "$HOME/.cargo/env"

# go clean install
# update the version occasionally...
wget https://go.dev/dl/go1.18.4.linux-amd64.tar.gz
sudo tar -C /usr/local -xzf go1.18.4.linux-amd64.tar.gz

# protobuf - a bit outdated probably...
sudo apt install protobuf-compiler -y

# terminator
sudo apt install terminator -y

# docker (includes compose)
sudo apt-get install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release

sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin

# node
curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash -
sudo apt-get install nodejs -y

# brave
sudo apt install apt-transport-https curl -y
sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list
sudo apt update
sudo apt install brave-browser -y

# install code, only-office, datagrip

