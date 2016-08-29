#!/bin/bash

git clone git@github.com:confluentinc/kafka-connect-elasticsearch.git
cd kafka-connect-elasticsearch
mvn clean package

