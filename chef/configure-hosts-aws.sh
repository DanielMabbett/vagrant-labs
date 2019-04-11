#!/usr/bin/env bash
# Configure the chef server on AWS 
sudo su
sudo echo "# Test of Hostname Entry into the hosts file on AWS Chef Server & Workstation" >> /etc/hosts
sudo echo "10.0.0.30   chefserver.example.com         chefserver" >> /etc/hosts
sudo echo "10.0.0.20   chefworkstation.example.com    chefworkstation" >> /etc/hosts
sudo echo "10.0.0.10   chefnode.example.com           chefnode" >> /etc/hosts