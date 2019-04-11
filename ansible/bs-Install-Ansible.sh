#!/usr/bin/env bash

#-------------------------------------------------------------------------------------#
# File:        bs-InstallAnsible.sh
# Author:      Daniel Mabbett
# Version:     0.1
# Date:        31/08/16
# Description: Installs Ansible for an Ubuntu Machine
#-------------------------------------------------------------------------------------#

sudo apt-get install software-properties-common -y # Fixed "are you sure?" feature
sudo apt-add-repository ppa:ansible/ansible -y
sudo apt-get update
sudo apt-get install ansible -y