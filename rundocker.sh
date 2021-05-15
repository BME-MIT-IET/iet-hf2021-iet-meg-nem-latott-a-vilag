#!/bin/bash

docker build -t domurl-test .
docker container ls 
docker rm -f domurl-test
docker run -d --name domurl-test -p 8081:8081 domurl-test

# for launching the page in the browser linux-only

xdg-open http://localhost:8081/