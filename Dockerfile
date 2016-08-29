FROM confluent/platform

COPY kafka-connect-elasticsearch /usr/share/java/

RUN ["mkdir", "/etc/kafka-connect-elasticsearch"]
RUN ["chown", "-R", "confluent:confluent", "/etc/kafka-connect-elasticsearch/", "/etc/schema-registry/connect-avro-standalone.properties"]

COPY kafka-connect-es.properties /etc/kafka-connect-elasticsearch/

ENTRYPOINT ["/usr/bin/connect-standalone", "/etc/schema-registry/connect-avro-standalone.properties", "/etc/kafka-connect-elasticsearch/kafka-connect-es.properties"]
