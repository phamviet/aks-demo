#!/usr/bin/env bash

kubectl delete deployment/api
kubectl delete svc/api

echo 'Done'