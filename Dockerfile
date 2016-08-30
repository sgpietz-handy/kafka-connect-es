FROM confluent/platform

COPY kafka-connect-elasticsearch /usr/share/java/kafka-connect-elasticsearch

RUN ["mkdir", "/etc/kafka-connect-elasticsearch"]
RUN ["chown", "-R", "confluent:confluent", "/etc/kafka-connect-elasticsearch/", "/tmp/"]

COPY kafka-connect-es.properties /etc/kafka-connect-elasticsearch/
COPY connect-avro-standalone.properties /etc/kafka-connect-elasticsearch/

USER confluent

WORKDIR /usr

ENTRYPOINT ["./bin/connect-standalone", "/etc/kafka-connect-elasticsearch/connect-avro-standalone.properties", "/etc/kafka-connect-elasticsearch/kafka-connect-es.properties"]
