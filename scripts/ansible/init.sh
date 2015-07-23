#!/bin/bash

SHARED_DIR=$1

#Ansible commands
ansible-playbook -i $SHARED_DIR/ansible/hosts $SHARED_DIR/ansible/vm.yml --connection=local --sudo -vvvv
