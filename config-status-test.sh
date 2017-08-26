#!/bin/bash

curl -i -X POST -k --url http://localhost:8001/apis/ --data 'name=status' --data 'uris=/v1/status' --data 'upstream_url=http://test-web'

curl -v http://localhost:8000/v1/status
