#!/bin/bash
# main.sh

# edit hosts file
# download package agent -> install package agent -> install puppet module
#                        -> add to sudoers -> sign certificate -> set run interval -> start service
source inc/set_master.sh
source inc/get_package.sh

echo "Started installing Puppet"

# adding a master host
set_master

# download package agent
#get_package
