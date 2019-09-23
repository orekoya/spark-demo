FROM java:8-jdk-alpine

ENV DAEMON_RUN=true
ENV SPARK_VERSION=2.4.4
ENV HADOOP_VERSION=2.7
ENV SCALA_VERSION=2.11.12
ENV SCALA_HOME=/usr/share/scala

COPY ["./scala-${SCALA_VERSION}.tgz", "./sbt-1.2.8.tgz", "/tmp/"]
RUN apk add --no-cache --virtual=.build-dependencies wget ca-certificates && \
    apk add --no-cache bash curl jq python3 coreutils procps && \
    cd "/tmp" && \
    tar xzf "scala-${SCALA_VERSION}.tgz" && \
    mkdir "${SCALA_HOME}" && \
    rm "/tmp/scala-${SCALA_VERSION}/bin/"*.bat && \
    mv "/tmp/scala-${SCALA_VERSION}/bin" "/tmp/scala-${SCALA_VERSION}/lib" "${SCALA_HOME}" && \
    ln -s "${SCALA_HOME}/bin/"* "/usr/bin/" && \
    apk del .build-dependencies
    
#Scala instalation
RUN export PATH="/usr/local/sbt/bin:$PATH" &&  \
    apk update && apk add ca-certificates wget tar && \
    mkdir -p "/usr/local/sbt"  && \
    tar -xvzf /tmp/sbt-1.2.8.tgz -C /usr/local/sbt/ --strip-components=1 && \
    rm -rf "/tmp/"*

RUN wget --no-verbose http://apache.mirror.iphh.net/spark/spark-${SPARK_VERSION}/spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}.tgz && tar -xvzf spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}.tgz \
      && mv spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION} spark \
      && rm spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}.tgz