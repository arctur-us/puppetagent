#!/bin/bash
# request_certificate.#!/bin/sh
function request_certificate {
  puppet agent --fingerprint
  sleep 5
  puppet agent -t
}
