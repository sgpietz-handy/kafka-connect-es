docker-compose up -d zookeeper
docker-compose up -d kafka
/bin/sleep 8
docker-compose up -d schema-registry
docker-compose up -d rest-proxy
docker-compose up -d elasticsearch

