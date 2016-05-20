#!/bin/bash

SHARED_DIR=$1

sudo yum -y install epel-release
sudo yum -y install ansible

export ANSIBLE_CONFIG=$SHARED_DIR/ansible/ansible.cfg
echo $ANSIBLE_CONFIG
cd $SHARED_DIR/ansible
#Ansible commands
ansible-playbook $SHARED_DIR/ansible/vm.yml --connection=local
