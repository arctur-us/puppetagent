#!/bin/bash
# set_master.sh
function set_master () {
  HOSTSFILE="/etc/hosts"
  if ! grep -Fq puppet "$HOSTSFILE"
  then
    # if not found
    echo | sudo tee -a $HOSTSFILE
    echo '192.168.56.7 puppet' | sudo tee -a $HOSTSFILE
  fi
  echo 'Master is defined'
}
