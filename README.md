# stateful-prism

Equips a Prism mock service with a state change endpoint to enable compatibility with Pact's standalone external verifier.

## Requirements
Requires `docker`

## Installation
Images should be built (if they do not exist) upon running the `verify.sh`, but can be built manually with `docker compose build`

## Usage
Verify a provider, using its OpenAPI specification, against a directory of Pacts by running the `verify.sh` script with arguments as follows:
```
./verify.sh ${PROVIDER} ${OPENAPI_DIR} ${PACT_DIR}
```

For example:
```
./verify.sh cbas ../cbas/common ../cbas-ui/pacts
```
