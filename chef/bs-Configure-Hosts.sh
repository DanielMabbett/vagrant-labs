#!/usr/bin/env bash

#-------------------------------------------------------------------------------------#
# File:        bs-Configure-Hosts
# Author:      Daniel Mabbett
# Version:     0.1
# Date:        08/09/16
# Description: Adds agent nodes into "hosts"
#-------------------------------------------------------------------------------------#

sudo echo "# Testing of hostname for Agents 1, 2, and 3." >> /etc/hosts
sudo echo "10.0.0.1   chefserver.contoso.com    chefserver" >> /etc/hosts
sudo echo "10.0.0.2   chefworkstation.contoso.com    chefworkstation" >> /etc/hosts
sudo echo "10.0.0.3   chefnode.contoso.com    chefnode" >> /etc/hosts
#sudo echo "10.0.0.3   corp.contoso.com    agent2" >> /etc/ansible/hosts
#sudo echo "10.0.0.4   corp.contoso.com    agent3" >> /etc/ansible/hosts