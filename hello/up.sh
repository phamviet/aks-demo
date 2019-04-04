#!/usr/bin/env bash

kubectl apply -f hello-deployment.yaml
kubectl apply -f hello-service.yaml

echo 'Done'