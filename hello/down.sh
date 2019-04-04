#!/usr/bin/env bash

kubectl delete deployment/hello
kubectl delete svc/hello

echo 'Done'