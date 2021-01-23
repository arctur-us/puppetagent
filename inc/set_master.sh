#!/bin/bash
# set_master
function set_master {
  HOSTSFILE="/etc/hosts"
  if grep -Fxq puppet "$HOSTSFILE"
  then
    # code if found
    echo 'Already in place'
  else
    # code if not found
    echo '192.168.56.2 puppet' | sudo tee -a $HOSTSFILE
  fi
  # case `grep -Fx puppet "$HOSTSFILE" >/dev/null; echo $?` in
  # 0)
  #   # code if not found
  #   echo '192.168.56.2 puppet' | sudo tee -a $HOSTSFILE
  #   ;;
  # 1)
  #   # code if found
  #   echo 'Already in place'
  #   ;;
  # *)
  #   # code if an error occurred
  #   ;;
  # esac
  ping -c 2 puppet
}
