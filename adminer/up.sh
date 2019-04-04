#!/usr/bin/env bash

kubectl apply -f adminer-deployment.yaml
kubectl apply -f adminer-service.yaml

echo 'Done'