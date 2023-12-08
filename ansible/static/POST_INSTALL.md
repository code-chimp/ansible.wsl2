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
su $USER

# login GitHub CLI
gh auth login
```

## Install favorite global NPM packages

```bash
npm i -g @mermaid-js/mermaid-cli firebase-tools npm-check-updates prettier serverless typescript yarn
```
