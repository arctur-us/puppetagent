#!/bin/bash
# set_master
function set_master {
  HOSTSFILE="/etc/hosts"
  # if grep -Fxqs "$HOSTSFILE" puppet
  # then
  #   # code if found
  #   echo 'Already in place'
  # else
  #   # code if not found
  #   echo '192.168.56.2 puppet' | sudo tee -a $HOSTSFILE
  # fi
  case `grep -Fx "$HOSTSFILE" "puppet" >/dev/null; echo $?` in
  0)
    # code if found
    echo 'Already in place'
    ;;
  1)
    # code if not found
    echo '192.168.56.2 puppet' | sudo tee -a $HOSTSFILE
    ;;
  *)
    # code if an error occurred
    ;;
  esac
  ping -c 2 puppet
}
