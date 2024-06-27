#!/bin/sh

now=$(date '+%Y-%m-%d %H:%M:%S')
echo "########################################################################################"
echo $now - "CERTIFICATE RENEW"


certbot certonly --webroot -w /webroot -d $DOMAIN --email $EMAIL --non-interactive --agree-tos $OPTIONS


part1=$(echo $DOMAIN | cut -d',' -f1)

letsencrypt_dir="/etc/letsencrypt/live/$part1"
certs_dir="/usr/local/etc/certs"

if [ ! -f "$letsencrypt_dir/privkey.pem" ]; then
    echo "no valid key found"
    exit 1
fi

cat "$letsencrypt_dir/privkey.pem" "$letsencrypt_dir/fullchain.pem" > "$certs_dir/$part1.pem"

grep -qF -- "$certs_dir/$part1.pem" $certs_dir/crt-list.txt || echo "$certs_dir/$part1.pem" >> $certs_dir/crt-list.txt



