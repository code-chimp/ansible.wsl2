#!/usr/bin/env zsh

touch .hushlogin

# put Vim back to the way I like it
vim -E +PlugInstall +qall
nvim -E +PlugInstall +qall

# Enable my config
cp ~/.zshrc.full ~/.zshrc

# gvim is not looking right with HDMI right now
sed -i -e 's/\"gvim/\"vim/g' ~/.zshrc

# this will make system browser launchable from WSL
echo '\nexport BROWSER=wslview' >> ~/.zshrc
