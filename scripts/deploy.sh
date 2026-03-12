#!/bin/bash

echo "Initializing Terraform..."
cd terraform
terraform init

echo "Planning Infrastructure..."
terraform plan

echo "Applying Infrastructure..."
terraform apply -auto-approve

echo "Deployment completed."
