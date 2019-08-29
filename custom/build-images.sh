#!/bin/bash

set -e

docker build -t spark-base:2.4.3 ./base
docker build -t spark-master:2.4.3 ./master
docker build -t spark-worker:2.4.3 ./worker
docker build -t spark-submit:2.4.3 ./submit