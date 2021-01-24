#!/bin/bash
# main.sh
#
# edit hosts file
# download package agent -> install package agent -> install puppet module
#                        -> add to sudoers -> sign certificate -> set run interval -> start service
# include additional sources
source inc/set_master.sh
source inc/get_package.sh
source inc/install_package.sh
source inc/puppet_module.sh

echo "Started installing Puppet"

# adding a master host
echo "Step 1 of 8"
set_master

# download package agent
echo "Step 2 of 8"
get_package

# install package agent
echo "Step 3 of 8"
install_package

# start puppet service
echo "Step 4 of 8"
start_agent
