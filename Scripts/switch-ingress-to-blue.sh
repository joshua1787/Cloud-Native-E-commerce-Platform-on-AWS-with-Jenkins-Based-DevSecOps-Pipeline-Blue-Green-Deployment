#!/bin/bash

INGRESS_NAME="ecom-ingress"
NAMESPACE="default"

echo "🔁 Switching Ingress [$INGRESS_NAME] back to BLUE services..."

kubectl patch ingress $INGRESS_NAME -n $NAMESPACE -p '{
  "spec": {
    "rules": [
      {
        "http": {
          "paths": [
            {
              "path": "/product",
              "pathType": "Prefix",
              "backend": {
                "service": {
                  "name": "product-service-blue",
                  "port": { "number": 80 }
                }
              }
            },
            {
              "path": "/auth",
              "pathType": "Prefix",
              "backend": {
                "service": {
                  "name": "auth-service-blue",
                  "port": { "number": 80 }
                }
              }
            },
            {
              "path": "/order",
              "pathType": "Prefix",
              "backend": {
                "service": {
                  "name": "order-service-blue",
                  "port": { "number": 80 }
                }
              }
            }
          ]
        }
      }
    ]
  }
}'

echo "✅ Ingress updated: traffic is now routed to BLUE versions."
