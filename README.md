## Kong testing for log output

Setup the testing infra with:

> ./kong-test-logs.sh

In a new terminal tab.

Setup the testing infra status endpoint with:

> ./config-status-test.sh 

Run the test with:

> ab -n 100000 -c 500 http://localhost:8000/v1/status

And watch the output in the first tab.  If that is not working run the following:

> docker exec -it kong tail -f  /usr/local/kong/logs/access.log /usr/local/kong/logs/error.log

Delete it all with:

> docker rm -f $(docker ps -a -q)
