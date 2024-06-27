#!/usr/bin/make

SHELL = /bin/sh


.PHONY: start stop create_self_signed_cert



start:
	docker compose --env-file=env -f haproxy.yml up -d haproxy nginx_certbot


stop:
	docker compose --env-file=env -f haproxy.yml down haproxy nginx_certbot



CERTS_DIR='stack_data/haproxy_data/certs'

create_self_signed_cert:

	openssl req -batch -nodes -x509 -newkey rsa:2048 -keyout ${CERTS_DIR}/self_signed.key -out ${CERTS_DIR}/self_signed.crt -days 30
	cat ${CERTS_DIR}/self_signed.crt ${CERTS_DIR}/self_signed.key > ${CERTS_DIR}/self_signed.pem
	rm ${CERTS_DIR}/self_signed.crt
	rm ${CERTS_DIR}/self_signed.key

	grep -qF -- /usr/local/etc/certs/self_signed.pem ${CERTS_DIR}/crt-list.txt || echo /usr/local/etc/certs/self_signed.pem >> ${CERTS_DIR}/crt-list.txt
