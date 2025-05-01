#!/bin/bash

# Set variables
ENV="blue"
NAMESPACE="default"
CHARTS_DIR="./helm-charts"
ECR_ACCOUNT_ID="123456789012"  # Replace with your AWS account ID
REGION="us-east-1"
BUILD_TAG="$1"                 # Optional: pass last known good build tag

if [ -z "$BUILD_TAG" ]; then
  echo "Usage: ./rollback-to-blue.sh <previous-stable-build-tag>"
  exit 1
fi

SERVICES=("product" "auth" "order")

for svc in "${SERVICES[@]}"; do
  echo "🔄 Rolling back $svc to BLUE environment..."

  helm upgrade ${svc}-blue ${CHARTS_DIR}/${svc} \
    --install \
    --namespace ${NAMESPACE} \
    --set env=${ENV} \
    --set name=${svc} \
    --set image.repository=${ECR_ACCOUNT_ID}.dkr.ecr.${REGION}.amazonaws.com/${svc} \
    --set image.tag=${BUILD_TAG}

  echo "✅ ${svc}-blue rollback applied."
done
