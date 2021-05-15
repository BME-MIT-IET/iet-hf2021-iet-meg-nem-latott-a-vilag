#!/bin/bash

docker build -t domurl-test .
docker container ls 
docker rm -f domurl-test
docker run --name domurl-test -p 8081:8081 domurl-test