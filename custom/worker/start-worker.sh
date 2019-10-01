#!/bin/bash

/usr/sbin/sshd && eval `ssh-agent -s` && ssh-add /root/.ssh/id_rsa;

echo "***** ssh setup seems to have gone ok *********"

export SPARK_HOME=/spark

. "/spark/sbin/spark-config.sh"
. "/spark/bin/load-spark-env.sh"

. "${SPARK_HOME}/sbin"/spark-daemon.sh start org.apache.spark.deploy.ExternalShuffleService 1

mkdir -p $SPARK_WORKER_LOG

ln -sf /dev/stdout $SPARK_WORKER_LOG/spark-worker.out

/spark/sbin/../bin/spark-class org.apache.spark.deploy.worker.Worker --webui-port $SPARK_WORKER_WEBUI_PORT $SPARK_MASTER >> $SPARK_WORKER_LOG/spark-worker.out