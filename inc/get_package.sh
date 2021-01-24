#!/bin/bash
function get_package {
  package='puppet5-release-bionic.deb'
  # need a check if package exists
  if ! dpkg -l | grep puppet
  then
    # get package
    sudo wget -O /tmp/${package} https://apt.puppetlabs.com/${package}
    sudo dpkg -i /tmp/${package}
  else
    echo 'Already have it'
  fi
}
