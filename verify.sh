#!/bin/bash
PROVIDER=$1 \
OPENAPI_DIR=$2 \
PACT_DIR=$3 \
REPORT_DIR=$(pwd) \
docker compose up --abort-on-container-exit --exit-code-from verifier
