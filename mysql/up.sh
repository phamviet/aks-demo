#!/usr/bin/env bash

kubectl apply -f db-disk.pvc.yaml

helm install --name db -f values.yaml stable/mysql

echo 'Done'