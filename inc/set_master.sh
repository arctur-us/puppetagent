#!/bin/bash
# set_master
function set_master {
  HOSTSFILE="/etc/hosts"
  if grep -Fxq "$HOSTSFILE" puppet
  then
    # code if found
    echo 'Already in place'
  else
    # code if not found
    echo '192.168.56.2 puppet' | sudo tee -a $HOSTSFILE
  fi
  ping -c 2 puppet
}
