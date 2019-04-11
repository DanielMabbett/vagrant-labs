#!/usr/bin/env bash

# Download & Install CHEF
sudo su 
# Check the workstation can ping the workstation 

#
sudo wget https://packages.chef.io/stable/ubuntu/12.04/chefdk_0.19.6-1_amd64.deb
# install the development kit deb
sudo dpkg -i chefdk_*.deb
# Remove the old chef dk deb file
rm chefdk_*.deb
# verify Chef components
chef verify
# Generate chef repository
cd ~
chef generate repo chef-repo
# Change directory to the chef repo
cd chef-repo
# make chef storage folder
mkdir .chef

# add keys (GO TO CHEF SERVER)
scp -3 vagrant@10.0.0.1:~/.chef/*.pem vagrant@10.0.0.2:~/chef-repo/.chef/
scp user@123.45.67.89:~/.chef/*.pem ~/chef-repo/.chef/

# knife configure
knife configure -i
# Important configure stuff
# /root/chef-repo/.chef