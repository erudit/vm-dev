#!/bin/bash

SHARED_DIR=$1

export ANSIBLE_CONFIG=$SHARED_DIR/ansible/ansible.cfg
echo $ANSIBLE_CONFIG
#Ansible commands
ansible-playbook $SHARED_DIR/ansible/vm.yml --connection=local --sudo 
