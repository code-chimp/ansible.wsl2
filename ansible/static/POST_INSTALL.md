# Post Install Steps

A few of the things that weren't easily automated.

## Initial Housecleaning

```bash
vim +PlugInstall +qall
mv ~/.zshrc.full ~/.zshrc
rm /tmp/*.deb
su tgoshinski
nvm i v20
nvm alias default stable
```
