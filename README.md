# stateful-prism

Equips a Prism mock service with a state change endpoint to enable compatibility with Pact's standalone external verifier.

## Requirements
Requires `docker`

## Installation
Images should be built (if they do not exist) upon running the `verify.sh`, but can be built manually with `docker compose build`

## Usage
From within the `stateful-prism` directory:

```
./verify.sh ${PROVIDER} ${OPENAPI_DIR} ${PACT_DIR}

// e.g.
./verify.sh cbas ../cbas/common ../cbas-ui/pacts
```
