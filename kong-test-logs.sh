#!/bin/bash

docker run -d --name kong-database -p 5432:5432 -e "POSTGRES_USER=kong" -e "POSTGRES_DB=kong" postgres:9.4

sleep 5

docker run -d --name test-web -p 80:80 nginx:1.13.3-alpine

docker run -it --rm --link kong-database:kong-database -e "KONG_DATABASE=postgres" -e "KONG_PG_HOST=kong-database" kong:0.11-alpine kong migrations up

docker run -it --name kong --link test-web --link kong-database:kong-database -e "KONG_DATABASE=postgres" -e "KONG_PG_HOST=kong-database" -e "KONG_LOG_LEVEL=error" -p 8000:8000 -p 8443:8443 -p 8001:8001 -p 8444:8444 kong:0.11-alpine
