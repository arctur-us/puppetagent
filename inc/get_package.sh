#!/bin/bash
function get_package {
  package='puppet5-release-bionic.deb'
  # need a check if installed
  if ! dpkg -l | grep puppet
  then
    # install package
    sudo wget -O /tmp/${package} https://apt.puppetlabs.com/${package}
    sudo dpkg -i /tmp/${package}
  fi
}
