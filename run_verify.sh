#!/bin/bash
OPENAPI_YAML=$1 \
PACT_DIR=$2 \
REPORT_DIR=$(pwd) \
docker compose \
  -f docker-compose.api.yml \
  -f docker-compose.verifier.yml \
  up \
  --abort-on-container-exit \
  --exit-code-from verifier \
