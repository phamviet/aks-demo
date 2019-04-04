#!/usr/bin/env bash

kubectl apply -f api-pvc.yaml
kubectl apply -f api-deployment.yaml
kubectl apply -f api-service.yaml
kubectl apply -f api-ingress.yaml

echo 'Done'