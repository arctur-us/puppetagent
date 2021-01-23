#!/bin/bash
function get_package {
  package='puppet5-release-bionic.deb'
  sudo wget -O /tmp/${package} https://apt.puppetlabs.com/${package}
  sudo dpkg -i /tmp/${package}
}
