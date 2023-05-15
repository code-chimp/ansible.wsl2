# WSL2 Ubuntu Base System Playbook

This is pretty much a pared down version of my [ansible.ubuntu](https://github.com/code-chimp/ansible.ubuntu)
repository. All of the tasks are tested in that project and then brought here.

## Set new instance up for running playbooks

Install the basics to bootstrap automation

```sh
apt install -y software-properties-common \
&& apt-add-repository -y ppa:ansible/ansible \
&& apt install -y curl git ansible build-essential sudo \
&& usermod -aG sudo tgoshinski
```

Login as user and should be able to let ansible handle the rest

### Run local

```bash
git clone https://github.com/code-chimp/ansible.wsl2
cd ansible.wsl2
ansible-playbook --ask-become-pass --ask-vault-pass local.yml
```

### Run remote

**NOTE:** `--ask-vault-pass` is incorrectly listed as an option for `ansible-pull` so need to supply
 a password file if attempting a remote pull

```sh
echo '<mondo secure password>' > DELETE_ME
ansible-pull -K --vault-pass-file DELETE_ME -U https://github.com/code-chimp/ansible.wsl2.git
rm DELETE_ME
```
