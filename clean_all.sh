#!/bin/bash
# clean_all.sh
find /etc/puppetlabs/puppet/ssl -name agentubuntu.pem -delete
rm /etc/puppetlabs/puppet/ssl/certs/ca.pem
