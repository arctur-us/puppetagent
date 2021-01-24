#!/bin/bash
# get_package.sh
function get_package {
  case "$1" in
    fedora)  for_fedora ;;
    ubuntu)  for_ubuntu ;;
    darwin)  echo "MacoSX" ;;
    cygwin)  echo "Cygwin" ;;
    win32)   echo "WINDOWS" ;;
    freebsd) echo "FreeBSD" ;;
    *)       echo "Unknown $1" ;;
  esac

}

function for_ubuntu {
  package='puppet5-release-bionic.deb'
  # check if package exists
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
  package=''
  echo "Here is to install"
}
