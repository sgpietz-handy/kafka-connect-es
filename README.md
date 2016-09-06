# kafka-connect-es

build docker image for kafka-connect-elasticsearch

`./build.sh`

start containters

`./start-containers.sh`

create new connector with post request

`curl -H "Content-Type: application/json" -X POST -d '{ "name": "elasticsearch-sink", "config": { "connector.class": "io.confluent.connect.elasticsearch.ElasticsearchSinkConnector", "tasks.max": "1", "topics": "test-elasticsearch-sink", "key.ignore": "true", "connection.url": "http://confluent:9200", "type.name": "kafka-connect" } }' http://confluent:8083/connectors`

update config for connector

`curl -H "Content-Type: application/json" -X PUT -d '{ "connector.class": "io.confluent.connect.elasticsearch.ElasticsearchSinkConnector", "tasks.max": "3", "topics": "test-elasticsearch-sink,mytopic", "key.ignore": "true", "connection.url": "http://confluent:9200", "type.name": "kafka-connect" }' http://confluent:8083/connectors/elasticsearch-sink/config`

send messages into kafka using kafka-avro-console producer (requires downloading confluent platform download)

```
kafka-avro-console-producer --broker-list localhost:9092 --topic test-elasticsearch-sink --property value.schema='{"type":"record","name":"myrecord","fields":[{"name":"f1","type":"string"}]}'
{"f1": "foo"}
{"f1": "bar"}
```

view data in elasticsearch

`curl -XGET 'http://localhost:9200/test-elasticsearch-sink/_search?pretty'`
