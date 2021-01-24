#!/bin/bash
# start_agent.sh
function start_agent {
  # This should go to j2 template in the future
  CONFFILE="/etc/puppetlabs/puppet/puppet.conf"
  if ! grep -Fq puppet "$CONFFILE"
  then
    # if not found
    echo | sudo tee -a $CONFFILE
    echo '[master]' | sudo tee -a $CONFFILE
    echo '  certname=puppet' | sudo tee -a $CONFFILE
  fi
  cat $CONFFILE
  echo 'Added to systemd'

  # check if already running and enabled
  sudo systemctl restart puppet
  sudo systemctl enable puppet
}
