#!/bin/bash
# start_agent.sh
function start_agent {
  sudo systemctl restart puppet
  sudo systemctl enable puppet
}
