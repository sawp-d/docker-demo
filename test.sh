#!/bin/sh
$ARM_CLIENT_ID=$1
$ARM_CLIENT_SECRET=$2
$AZ_TENANT_ID=$3
RETRIES=0
MAX_RETRIES=3
until [ az login --service-principal -u $ARM_CLIENT_ID -p $ARM_CLIENT_SECRET --tenant $AZ_TENANT_ID --output none || $RETRIES -ge $MAX_RETRIES ]
do 
  echo "Waiting for service principal..."
  RETRIES=$((RETRIES+1))
  sleep 2
done
