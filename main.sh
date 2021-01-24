#!/bin/bash
# main.sh
#
# include additional sources
source inc/get_platform.sh
source inc/set_master.sh
source inc/get_package.sh
source inc/request_certificate.sh
source inc/start_agent.sh

echo "Started installing Puppet"

os=`get_platform`

# adding a master host
echo "Step 1 of 4"
set_master

# install an agent
echo "Step 2 of 4"
get_package $os

# start puppet service
echo "Step 3 of 4"
start_agent $os

# certificate request
echo "Step 4 of 4"
#request_certificate

echo "Done. Puppet is installed!"
