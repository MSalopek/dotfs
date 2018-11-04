### Setup and pull
git init
git remote add origin https://github.com/MSalopek/dotfs
git pull origin master

### Setup zsh and install fzf
sudo apt-get install zsh
chsh -s /usr/bin/zsh

git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
