#!/bin/bash
# install_package
function install_package {
  # need a check if installed
  if ! apt list --installed 2>/dev/null | grep puppet
  then
    # install package
    sudo apt install -y puppet-agent
  else
    echo 'Already installed'
  fi
}
