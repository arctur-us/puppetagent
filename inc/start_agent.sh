#!/bin/bash
# start_agent.sh
function start_agent {
  case "$1" in
    fedora)  at_fedora ;;
    ubuntu)  at_ubuntu ;;
    darwin)  echo "To Do MacoSX" ;;
    cygwin)  echo "To Do Cygwin" ;;
    win32)   echo "To Do WINDOWS" ;;
    freebsd) echo "To Do FreeBSD" ;;
    *)       echo "Unknown $1" ;;
  esac
  # check if already running and enabled
  systemctl restart puppet
  systemctl enable puppet
  echo 'Added to systemd'
}

function at_fedora {
  CONFFILE="/etc/puppet/puppet.conf"
  puppet_conf $CONFFILE
}

function at_ubuntu {
  SUDOERS="/etc/sudoers"
  if ! grep -cq puppetlabs "$SUDOERS"
  then
    # if found 0 match
    chmod 640 $SUDOERS
    SEARCH='secure_path="'
    REPLACE='secure_path="\/opt\/puppetlabs\/bin\:'
    sed -i -e "s/$SEARCH/$REPLACE/g" $SUDOERS
    chmod 440 $SUDOERS
  fi

  # This should go to j2 template in the future
  CONFFILE="/etc/puppetlabs/puppet/puppet.conf"
  puppet_conf $CONFFILE
}

function puppet_conf {
  if ! grep -Fq master "$1"
  then
    # if not found
    echo | tee -a $1
    echo '[master]' | tee -a $1
    echo '  certname=puppet' | tee -a $1
    echo '[agent]' | tee -a $1
    echo "  certname=`hostname`" | tee -a $1
    echo "  runinterval=2m" | tee -a $1
  else
    echo "Nothing added to puppet.conf"
  fi
}
