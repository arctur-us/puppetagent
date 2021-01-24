#!/bin/bash
# request_certificate.#!/bin/sh
function request_certificate {
  puppet agent --fingerprint
  sleep 10
  puppet agent -t
}
