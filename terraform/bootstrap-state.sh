#!/usr/bin/env bash
set -euo pipefail

RG="koalatech-tfstate-rg"
SA="koalatechtfstate102"
LOC="australiaeast"

az group create --name "$RG" --location "$LOC" --output none

az storage account create \
  --name "$SA" \
  --resource-group "$RG" \
  --location "$LOC" \
  --sku Standard_LRS \
  --allow-blob-public-access false \
  --output none

KEY="$(az storage account keys list \
  --resource-group "$RG" \
  --account-name "$SA" \
  --query "[0].value" \
  --output tsv)"

az storage container create \
  --name tfstate \
  --account-name "$SA" \
  --account-key "$KEY" \
  --output none

echo "ARM_ACCESS_KEY=$KEY" >> "$GITHUB_ENV"
