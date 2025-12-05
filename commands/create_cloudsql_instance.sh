#!/usr/bin/env bash
# Create a Cloud SQL for PostgreSQL instance configured for Datastream CDC.

set -e

# Instance name
POSTGRES_INSTANCE=postgres-db

# Datastream public IPs for the lab's region (example: us-east1)
# These IPs are allowed to connect to the Cloud SQL instance.
DATASTREAM_IPS=34.74.216.163,34.75.166.194,104.196.6.24,34.73.50.6,35.237.45.20

# Region for the Cloud SQL instance
REGION=us-east1

echo "Creating Cloud SQL PostgreSQL instance: ${POSTGRES_INSTANCE} in region ${REGION}..."

gcloud sql instances create "${POSTGRES_INSTANCE}" \
  --database-version=POSTGRES_14 \
  --cpu=2 \
  --memory=10GB \
  --authorized-networks="${DATASTREAM_IPS}" \
  --region="${REGION}" \
  --root-password="pwd" \
  --database-flags=cloudsql.logical_decoding=on

echo "Instance ${POSTGRES_INSTANCE} created."
echo "Remember to look up its public IP in the Cloud SQL console for the Datastream connection profile."
