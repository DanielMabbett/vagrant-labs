#!/usr/bin/env bash
#-------------------------------------------------------------------------------------#
# File:        install-chef-node.sh
# Author:      Daniel Mabbett
# Version:     0.1
# Date:        31/08/16
# Description: install chef client
#-------------------------------------------------------------------------------------#

# from server
# scp goautomate-validator.pem vagrant@chefnode:/etc/chef/
sudo apt-get install chef -y
knife ssl fetch -S https://chefserver.contoso.com 
# knife ssl fetch -S https://chefserver.example.com 
# can check .chef file has downloaded by going to the folder
cd /home/vagrant/.chef/
ls

# can check ssl
knife ssl check -s https://chefserver.contoso.com   

# now
cd /etc/chef
vim client.rb 
sudo echo "log_level :info" >> /etc/chef/client.rb
sudo echo "log_location STDOUT" >> /etc/chef/client.rb
sudo echo "server_url 'https://chefserver.contoso.com:443'" >> /etc/chef/client.rb
sudo echo "trusted_certs_dir '/root/.chef/trusted_certs'" >> /etc/chef/client.rb

# now client chef pull
chef-client -S https://chefserver.contoso.com -K /etc/chef/goautomate-validator.pem