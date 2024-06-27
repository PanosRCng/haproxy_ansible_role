#!/bin/bash

docker compose --env-file=env -f haproxy.yml up certbot | tee -a stack_data/certbot_data/logs/log.txt


docker compose --env-file=env -f haproxy.yml down certbot


docker compose --env-file=env -f haproxy.yml restart haproxy nginx_certbot