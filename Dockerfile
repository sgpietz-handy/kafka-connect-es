FROM confluent/platform

COPY kafka-connect-elasticsearch /usr/share/java/kafka-connect-elasticsearch

RUN ["mkdir", "/etc/kafka-connect-elasticsearch"]
RUN ["chown", "-R", "confluent:confluent", "/etc/kafka-connect-elasticsearch/", "/tmp/"]

COPY etc/kafka-connect-es.properties /etc/kafka-connect-elasticsearch/
COPY etc/connect-avro-distributed.properties /etc/kafka-connect-elasticsearch/

USER confluent

WORKDIR /usr

EXPOSE 8083

ENTRYPOINT ["./bin/connect-distributed", "/etc/kafka-connect-elasticsearch/connect-avro-distributed.properties", "/etc/kafka-connect-elasticsearch/kafka-connect-es.properties"]
