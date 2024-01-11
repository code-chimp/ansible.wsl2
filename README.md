# WSL2 Ubuntu Base System Playbook

This is pretty much a pared down version of my [ansible.ubuntu](https://github.com/code-chimp/ansible.ubuntu)
repository. All of the tasks are tested in that project and then brought here.

## Important note

Ensure your Git autocrlf is set to **input** before you clone this repository. This is necessary to keep the correct line-endings for the files to be run in Linux.

```sh
git config --global core.autocrlf input
```

## Set up/access WSL Ubuntu instance and run playbook

Thanks to my friend Bhuvan, I can let PowerShell do the heavy lifting:

```sh
.\setup.ps1
```

## Post Install

You will need to terminate the distro you just installed for it to pick up the new `wsl.conf`

```sh
wsl --terminate Ubuntu
```

The next time you launch your distro check your home directory for the `POST_INSTALL.md` file for final instructions.

# TODO:

- [ ] Grab a scrub laptop and try out/debug Windows env setup
- [ ] Add [rbenv](https://github.com/ccmywish/rbenv-for-windows#readme) once we have the permissions sussed
