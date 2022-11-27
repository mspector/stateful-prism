#!/bin/bash
OPENAPI_DIR=$1 \
docker compose -f docker-compose.api.yml up
