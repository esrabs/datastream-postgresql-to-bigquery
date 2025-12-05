#!/usr/bin/env bash
# Connect to the Cloud SQL PostgreSQL instance using the postgres user.

set -e

POSTGRES_INSTANCE=postgres-db

echo "Connecting to PostgreSQL instance: ${POSTGRES_INSTANCE}..."
echo "You will be prompted for the password (lab default: pwd)."

gcloud sql connect "${POSTGRES_INSTANCE}" --user=postgres
