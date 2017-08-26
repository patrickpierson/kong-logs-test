#!/bin/bash

# Setup the status endpoint
curl -i -X POST -k --url http://localhost:8001/apis/ --data 'name=status' --data 'uris=/v1/status' --data 'upstream_url=http://test-web'

# Test it
curl -v http://localhost:8000/v1/status
