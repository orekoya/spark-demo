 #!/bin/bash
 
ENV DEPLOY_MODE client
ENV EXEC_CORES 1

echo "list files in spark-data"

ls -lath /opt/spark-data/;

echo "********************"
echo "list files in spark-apps"

ls -lath /opt/spark-apps/;

printenv;

/spark/bin/spark-submit \
--class ${SPARK_APPLICATION_MAIN_CLASS} \
--master ${SPARK_MASTER_URL} \
--deploy-mode ${DEPLOY_MODE} \
--total-executor-cores ${EXEC_CORES} \
 ${SPARK_SUBMIT_ARGS} \
 ${SPARK_APPLICATION_JAR_LOCATION} \
 ${SPARK_APPLICATION_ARGS} 
