#!/bin/bash
function get_package {
  package='puppet5-release-bionic.deb'
  wget https://apt.puppetlabs.com/${package} -o /tmp/${package}
}
