#!/usr/bin/env bash

#-------------------------------------------------------------------------------------#
# File:        bootstrap.sh
# Author:      Daniel Mabbett
# Version:     0.1
# Date:        31/08/16
# Description: default bootstrap for ansible workshop virtual machines
#-------------------------------------------------------------------------------------#

sudo apt-get update 

sudo apt-get install -y openssh-client
sudo apt-get install -y openssh-server
#sudo apt-get install -y puppet

# disables the firewall so that putty can connect
sudo ufw disable