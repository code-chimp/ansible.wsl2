# Post Install Steps

A few of the things that were not easily automated.

## Initial Housecleaning

```bash
# put Vim back to the way I like it
vim +PlugInstall +qall

# Enable my config
mv ~/.zshrc.full ~/.zshrc
# this will make system browser launchable from WSL
echo 'export BROWSER=wslview' >> ~/.zshrc
# load zshrc changes
su tgoshinski

# login GitHub CLI
gh auth login

# set up default Node/NPM
nvm i v20
nvm alias default stable
```
