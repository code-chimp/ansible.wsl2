# Post Install Steps

A few of the things that were not easily automated.

## Initial Housecleaning

The post install installs all `vim` plugins, updates the ZSH config
and installs my standard global `npm` packages.

```bash
# run the post install script
./post.sh

# load zshrc changes
su $USER

# login GitHub CLI
gh auth login
```
