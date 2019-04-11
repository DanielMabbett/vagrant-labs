#!/usr/bin/env bash

#-------------------------------------------------------------------------------------#
# File:        bs-Configure-HostsForMaster
# Author:      Daniel Mabbett
# Version:     0.1
# Date:        08/09/16
# Description: Adds agent nodes into "hosts"
#-------------------------------------------------------------------------------------#

sudo echo "# Testing of hostname for Agents 1, 2, and 3." >> /etc/ansible/hosts
sudo echo "10.0.0.2   corp.contoso.com    agent1" >> /etc/ansible/hosts
sudo echo "10.0.0.3   corp.contoso.com    agent2" >> /etc/ansible/hosts
sudo echo "10.0.0.4   corp.contoso.com    agent3" >> /etc/ansible/hosts