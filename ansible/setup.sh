#!/usr/bin/env bash

## Install ansible
sudo apt-add-repository -y ppa:ansible/ansible
sudo apt-get update -y
sudo apt-get install -y curl git software-properties-common ansible

# run ansible playbook
ansible-playbook --ask-become-pass --ask-vault-pass ./local.yml
