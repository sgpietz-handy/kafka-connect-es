FROM confluent/platform

COPY kafka-connect-elasticsearch /usr/share/java/

RUN ["mkdir", "/etc/kafka-connect-elasticsearch"]
RUN ["chown", "-R", "confluent:confluent", "/etc/kafka-connect-elasticsearch/"]

COPY kafka-connect-es.properties /etc/kafka-connect-elasticsearch/
COPY connect-avro-standalone.properties /etc/kafka-connect-elasticsearch/

User confluent

ENTRYPOINT ["/usr/bin/connect-standalone", "/etc/kafka-connect-elasticsearch/connect-avro-standalone.properties", "/etc/kafka-connect-elasticsearch/kafka-connect-es.properties"]
