#!/bin/bash
function get_platform {
  if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    linux=`cat /etc/os-release | grep ^ID= | sed 's/.*=//'`
    if [[ "$linux" == "fedora" ]]; then
      echo "Fedora"
    elif [[ "$linux" == "ubuntu" ]]; then
      echo "Ubuntu"
    else
      echo $linux
    fi
  elif [[ "$OSTYPE" == "darwin"* ]]; then
    echo "Darwin"
  elif [[ "$OSTYPE" == "cygwin" ]]; then
    # POSIX compatibility layer and Linux environment emulation for Windows
    echo "Emu"
  elif [[ "$OSTYPE" == "msys" ]]; then
    # Lightweight shell and GNU utilities compiled for Windows (part of MinGW)
    echo "Mingw"
  elif [[ "$OSTYPE" == "win32" ]]; then
    # I'm not sure this can happen.
    echo "Win"
  elif [[ "$OSTYPE" == "freebsd"* ]]; then
    echo "Freebsd"
  else
    echo "OS not supported"
  fi
}
