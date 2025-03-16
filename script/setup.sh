#!/bin/bash -ue

kind create cluster --config ./kind/config.yaml

kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/refs/heads/main/deploy/static/provider/kind/deploy.yaml
