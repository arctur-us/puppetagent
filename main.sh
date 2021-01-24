#!/bin/bash
# main.sh
#
# include additional sources
source <(cat inc/*)

echo "Started installing Puppet"

os=`facter osfamily`
echo $os

# adding a master host
echo "Step 1 of 5"
set_master

# download package agent
echo "Step 2 of 5"
# get_package

# install package agent
echo "Step 3 of 5"
# install_package

# start puppet service
echo "Step 4 of 5"
# start_agent

# certificate request
echo "Step 5 of 5"
#request_certificate

echo "Done. Puppet is installed!"
