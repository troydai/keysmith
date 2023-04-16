#!/bin/bash

set -e

EXAMPLE_OUTPUT=$(dirname $(readlink -f $0))/output
mkdir -p $EXAMPLE_OUTPUT

docker build -t keysmith:`git describe --tags` .

docker run --rm \
    -v $EXAMPLE_OUTPUT:/mnt/output \
    -e OUTPUT_DIR=/mnt/output \
    -e CN_SUBJECT="/C=US/ST=WA/L=Redmond/O=TDFund/OU=KeySmith/CN=keysmith.troydai.cc" \
    keysmith:`git describe --tags`
