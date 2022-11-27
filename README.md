# stateful-prism

Equips a Prism mock service with a state change endpoint to enable compatibility with Pact's standalone external verifier.

## Requirements
The `run_verify.sh` script requires `docker`.

## Installation
The docker image should be built (if it does not exist) upon running `run_verify.sh`, but can be built manually with `build.sh`.

## Usage
Verify a provider, using its OpenAPI specification, against a directory of Pacts by running the `run_verify.sh` script with arguments as follows:
```
./run_verify.sh ${PROVIDER} ${OPENAPI_DIR} ${PACT_DIR}
```

For example:
```
./run_verify.sh cbas ../cbas/common ../cbas-ui/pacts
```

## Details

For each endpoint tested, the provider OpenAPI YAML must have examples specified by the `examples` field (see "multiple examples for a parameter" in the [OpenAPI documentation](https://swagger.io/docs/specification/adding-examples/)). 

Each example key must exactly match the name of the corresponding provider state in the tested Pact (`backend_data_exists` in the example below).

Example OpenAPI YAML:
```
openapi: 3.0.3
info: ...
paths:
  /data:
    get:
      responses:
        '200':
          description: "an endpoint for getting backend data"
          content:
            application/json:
              ...
              examples:
                backend_data_exists: 
                  value: {foo: bar}
```

Example Pact:
```
{
  "consumer": {
    "name": "frontend-website"
  },
  "interactions": [
    {
      "description": "get backend data",
      "providerStates": [
        {
          "name": "backend_data_exists"
        }
      ],
      ...
    }
    ...
  ]
  ...
}

```
