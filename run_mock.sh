#!/bin/bash
OPENAPI_YAML=$1 \
docker compose -f docker-compose.api.yml up
