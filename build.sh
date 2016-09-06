#!/bin/bash

git clone git@github.com:confluentinc/kafka-connect-elasticsearch.git
cd kafka-connect-elasticsearch
mvn clean package -U
cp target/kafka-connect-elasticsearch-3.1.0-SNAPSHOT-package/share/java/kafka-connect-elasticsearch ./
cd -
docker build -t connect-es-dist .
