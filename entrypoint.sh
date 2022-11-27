#!/bin/sh
prism mock openapi.yml &
node stateful-prism.js
