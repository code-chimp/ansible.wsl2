# Post Install Steps

A few of the things that were not easily automated.

## Initial Housecleaning

```bash
# put Vim back to the way I like it
vim +PlugInstall +qall

# Enable my config
mv ~/.zshrc.full ~/.zshrc

# clean up
sudo rm /tmp/*.deb
su tgoshinski

# set up default Node/NPM
nvm i v20
nvm alias default stable
```
