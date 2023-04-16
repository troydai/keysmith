#!/bin/bash

set -e

WORKDIR=$(dirname $(readlink -f $0))

echo "Build up the pod ..."
kubectl apply -f $WORKDIR
echo ""

echo "Waiting for example pod to be ready..."
kubectl wait -n keysmith-example pod/keysmith-example-pod --for condition=ready
echo ""

echo "Read certificate from pod ..."
kubectl exec -n keysmith-example pod/keysmith-example-pod -c main -- cat /tmp/root.crt.pem 
echo ""

echo "Clean up ..."
kubectl delete -f $WORKDIR --grace-period=0
