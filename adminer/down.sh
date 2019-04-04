#!/usr/bin/env bash

kubectl delete deployment/adminer
kubectl delete svc/adminer

echo 'Done'