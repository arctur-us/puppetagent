#!/bin/bash
function get_platform {
  if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    linux=`cat /etc/os-release | grep ^ID= | sed 's/.*=//'`
    if [[ "$linux" == "fedora" ]]; then
      echo "fedora"
    elif [[ "$linux" == "ubuntu" ]]; then
      echo "ubuntu"
    fi
  elif [[ "$OSTYPE" == "darwin"* ]]; then
    echo "darwin"
  elif [[ "$OSTYPE" == "cygwin" ]]; then
    # POSIX compatibility layer and Linux environment emulation for Windows
    echo "emu"
  elif [[ "$OSTYPE" == "win32" ]]; then
    # I'm not sure this can happen.
    echo "win"
  elif [[ "$OSTYPE" == "freebsd"* ]]; then
    echo "frebsd"
  else
    echo "OS not supported"
  fi
}
