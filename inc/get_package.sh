#!/bin/bash
# get_package.sh
function get_package {
  case "$1" in
    fedora)  for_fedora ;;
    ubuntu)  for_ubuntu ;;
    darwin)  for_macosx ;;
    cygwin)  echo "To Do Cygwin" ;;
    win32)   echo "To Do WINDOWS" ;;
    freebsd) echo "To Do FreeBSD" ;;
    *)       echo "Unknown $1" ;;
  esac
}

function for_macosx {
  package='puppet-agent-latest.dmg'
  repoURL='https://downloads.puppetlabs.com/mac/10.13/PC1/x86_64'
  installdmg ${repoURL}/${package}
}

function installdmg {
    set -x
    tempd=$(mktemp -d)
    curl $1 > $tempd/pkg.dmg
    listing=$(sudo hdiutil attach $tempd/pkg.dmg | grep Volumes)
    volume=$(echo "$listing" | cut -f 3)
    if [ -e "$volume"/*.app ]; then
      sudo cp -rf "$volume"/*.app /Applications
    elif [ -e "$volume"/*.pkg ]; then
      package=$(ls -1 "$volume" | grep .pkg | head -1)
      sudo installer -pkg "$volume"/"$package" -target /
    fi
    sudo hdiutil detach "$(echo "$listing" | cut -f 1)"
    rm -rf $tempd
    set +x
}

function for_ubuntu {
  package='puppet5-release-bionic.deb'
  repoURL='https://apt.puppetlabs.com'
  if ! dpkg -l | grep puppet
  then
    # get package
    wget -O /tmp/${package} ${repoURL}/${package}
    dpkg -i /tmp/${package}
  fi
  if ! apt list --installed 2>/dev/null | grep puppet-agent
  then
    # install package
    apt install -y puppet-agent
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
