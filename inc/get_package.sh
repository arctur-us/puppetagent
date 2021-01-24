#!/bin/bash
# get_package.sh
function get_package {
  case "$1" in
    fedora)  for_fedora ;;
    ubuntu)  for_ubuntu ;;
    darwin)  echo "To Do MacoSX" ;;
    cygwin)  echo "To Do Cygwin" ;;
    win32)   echo "To Do WINDOWS" ;;
    freebsd) echo "To Do FreeBSD" ;;
    *)       echo "Unknown $1" ;;
  esac

}

function for_ubuntu {
  package='puppet5-release-bionic.deb'
  if ! dpkg -l | grep puppet
  then
    # get package
    sudo wget -O /tmp/${package} https://apt.puppetlabs.com/${package}
    sudo dpkg -i /tmp/${package}
  else
    echo 'Already have it'
  fi
}

function for_fedora {
  package='puppet5-release-fedora-31.noarch.rpm'
  repoURL='https://yum.puppet.com'
  if ! rpm -qa | grep puppet
  then
    rpm -Uvh ${repoURL}/${package}
    yum install puppet -y
  else
    echo 'Already have it'
  fi
}
