#!/bin/bash

[ "$UID" -eq 0 ] || { echo "this operation must be run as root."; exit 1;}


find stack_data -depth ! \( -name 'stack_data' -o -name 'certbot_data' -o -name 'letsencrypt' -o -name 'logs' -o -name 'scripts' -o -name 'manage_cert.sh' -o -name 'webroot' -o -name 'haproxy_data' -o -name 'certs' -o -name 'cfg' -o -name 'haproxy.cfg.example' -o -name '.gitkeep' \) \
 -type d,f -exec rm -rvf {} +