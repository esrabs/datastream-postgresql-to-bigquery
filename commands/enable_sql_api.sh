#!/usr/bin/env bash
# Enable the Cloud SQL Admin API for the current project.
# Required before creating any Cloud SQL instances.

set -e

echo "Enabling Cloud SQL Admin API (sqladmin.googleapis.com)..."
gcloud services enable sqladmin.googleapis.com

echo "Done."
