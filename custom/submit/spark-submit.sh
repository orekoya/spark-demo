 #!/bin/bash
 
 ls -lath /opt/spark-data/;

echo "********************"

 ls -lath /opt/spark-apps/;

/spark/bin/spark-submit \
--class ${SPARK_APPLICATION_MAIN_CLASS} \
--master ${SPARK_MASTER_URL} \
--deploy-mode client \
--total-executor-cores 1 \
 ${SPARK_SUBMIT_ARGS} \
 ${SPARK_APPLICATION_JAR_LOCATION} \
 ${SPARK_APPLICATION_ARGS} 