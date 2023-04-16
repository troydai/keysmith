#!/bin/sh

set -e

if [[ -z "${OUTPUT_DIR}" ]]; then
	echo "OUTPUT_DIR is not set" >&2
	exit 1
fi

if [[ -z "${CN_SUBJECT}" ]]; then
	echo "CN_SUBJECT is not set" >&2
	exit 1
fi

CRT_OUT=$OUTPUT_DIR/root.crt.pem
KEY_OUT=$OUTPUT_DIR/root.key.pem

apk add --update-cache openssl && rm -rf /var/cache/apk/*

echo "Generate on `date`" > $OUTPUT_DIR/release.md
echo "`openssl version`" >> $OUTPUT_DIR/release.md

openssl ecparam -out $KEY_OUT \
	-name secp521r1 -genkey -noout

openssl req -x509 -sha256 -new -nodes -key $KEY_OUT -out $CRT_OUT \
	-days 30 -subj $CN_SUBJECT
