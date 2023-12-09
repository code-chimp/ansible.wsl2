#!/usr/bin/env zsh

touch .hushlogin

# put Vim back to the way I like it
vim -E +PlugInstall +qall

# Enable my config
mv ~/.zshrc.full ~/.zshrc

# gvim is not looking right with HDMI right now
sed -i -e 's/\"gvim/\"vim/g' ~/.zshrc

# this will make system browser launchable from WSL
echo '\nexport BROWSER=wslview' >> ~/.zshrc

# install default global npm packages
npm i -g @mermaid-js/mermaid-cli firebase-tools npm-check-updates prettier serverless typescript yarn
