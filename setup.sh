#!/bin/bash

# 1. Clean up
echo "🧹 Wiping old cluster..."
minikube delete --all

# 2. Start Cluster
echo "🚀 Starting 3-Node Cluster with 8GB RAM..."
minikube start --nodes 3 --driver=docker --cpus=4 --memory=8192

# 3. Apply Infrastructure
echo "📦 Deploying DevOps Stack..."
kubectl apply -f jenkins.yaml
kubectl apply -f sonarqube.yaml
kubectl apply -f monitoring.yaml
kubectl apply -f app-deploy.yaml

echo "⏳ Waiting for pods to initialize..."
sleep 20

echo "✅ Deployment finished! Checking node distribution:"
kubectl get pods -o wide --sort-by=.spec.nodeName
