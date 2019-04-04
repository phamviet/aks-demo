#!/usr/bin/env bash

kubectl apply -f adminer-deployment.yaml
kubectl apply -f adminer-service.yaml
kubectl apply -f adminer-ingress.yaml

echo 'Done'