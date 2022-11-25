#!/bin/sh
prism mock openapi/$OPENAPI_FILE &
node stateful-prism.js
