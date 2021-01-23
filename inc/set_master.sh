#!/bin/bash
# set_master
function set_master {
  echo '192.168.56.2 puppet' | sudo tee -a /etc/hosts
  ping -c 2 puppet
}
