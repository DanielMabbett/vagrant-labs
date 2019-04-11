#!/usr/bin/env bash

# Run in elevated mode
sudo su 
# Get deb packages
sudo wget https://packages.chef.io/stable/ubuntu/16.04/chef-server-core_12.10.0-1_amd64.deb
# Unpack deb
sudo dpkg -i chef-server-core_*.deb
# Remove deb
rm chef-server-core_*.deb
# reconfigure and start up the chef server 
sudo chef-server-ctl reconfigure
# make a directory called .chef 
cd ~
mkdir .chef
# Create the username and organisation for che  server
sudo chef-server-ctl user-create daniel_mabbett daniel mabbett dmabbett94@hotmail.co.uk password --filename ~/.chef/daniel_mabbett.pem
sudo chef-server-ctl org-create goautomate goautomate --association_user daniel_mabbett --filename ~/.chef/goautomate.pem
# "/home/vagrant/.chef"

# verify with 
sudo chef-server-ctl status

# OPTIONAL INSTALL chef-server management portal (website)
sudo chef-server-ctl install chef-manage