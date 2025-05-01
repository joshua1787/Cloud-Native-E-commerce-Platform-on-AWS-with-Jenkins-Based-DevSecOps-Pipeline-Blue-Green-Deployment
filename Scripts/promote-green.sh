#!/bin/bash

# Set common variables
ENV="green"
NAMESPACE="default"
CHARTS_DIR="./helm-charts"
ECR_ACCOUNT_ID="123456789012"  # Replace with your AWS account ID
REGION="us-east-1"
BUILD_TAG="$1"                 # Optional: pass build tag as arg

if [ -z "$BUILD_TAG" ]; then
  echo "Usage: ./promote-green.sh <build-tag>"
  exit 1
fi

SERVICES=("product" "auth" "order")

for svc in "${SERVICES[@]}"; do
  echo "🚀 Promoting $svc to GREEN environment..."

  helm upgrade ${svc}-green ${CHARTS_DIR}/${svc} \
    --install \
    --namespace ${NAMESPACE} \
    --set env=${ENV} \
    --set name=${svc} \
    --set image.repository=${ECR_ACCOUNT_ID}.dkr.ecr.${REGION}.amazonaws.com/${svc} \
    --set image.tag=${BUILD_TAG}

  echo "✅ ${svc}-green deployment applied."
done
