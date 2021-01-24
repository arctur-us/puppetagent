#!/bin/bash
# start_agent.sh
function start_agent {
  SUDOERS="/root/sudoers"
  if grep -c puppetlabs "$SUDOERS"
  then
    # if found 0 matches
    chmod 640 $SUDOERS
    SEARCH='secure_path="'
    REPLACE='secure_path="\/opt\/puppetlabs\/bin\:'
    sed -i -e "s/$SEARCH/$REPLACE/g" $SUDOERS
    chmod 440 $SUDOERS
  fi

  # This should go to j2 template in the future
  CONFFILE="/etc/puppetlabs/puppet/puppet.conf"
  if ! grep -Fq master "$CONFFILE"
  then
    # if not found
    echo | sudo tee -a $CONFFILE
    echo '[master]' | sudo tee -a $CONFFILE
    echo '  certname=puppet' | sudo tee -a $CONFFILE
    echo '[agent]' | sudo tee -a $CONFFILE
    echo "  certname=`hostname`" | sudo tee -a $CONFFILE
  else
    echo "Nothing added to puppet.conf"
  fi

  echo 'Added to systemd'

  # check if already running and enabled
#  sudo systemctl restart puppet
#  sudo systemctl enable puppet
}
