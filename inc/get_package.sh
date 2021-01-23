#!/bin/bash
function get_package {
  package='puppet5-release-bionic.deb'
  sudo wget https://apt.puppetlabs.com/${package} -o /tmp/${package}
  sudo dpkg -i /tmp/${package}
}
