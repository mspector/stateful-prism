# stateful-prism

Equips a Prism mock service with a state change endpoint to enable compatibility with Pact's standalone external verifier.

## Usage
Verify a provider, using its OpenAPI specification, against a directory of Pacts by running the `run_verify.sh` script with arguments as follows:
```
./run_verify.sh ${OPENAPI_YAML} ${PACT_DIR}
```

For example:
```
./run_verify.sh ../cbas/common/openapi.yml ../cbas-ui/pacts
```

Run a mock server without running the verifier:
```
./run_mock.sh ../cbas/common/openapi.yml
```

## Requirements
You'll need Docker to use this.

Also: for each endpoint tested, the provider OpenAPI YAML must have examples specified by the `examples` field (see "multiple examples for a parameter" in the [OpenAPI documentation](https://swagger.io/docs/specification/adding-examples/)). 

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
