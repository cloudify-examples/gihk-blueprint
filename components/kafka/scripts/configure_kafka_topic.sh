#!/bin/bash -e

cd /opt/kafka/kafka_2.10-0.8.2.0

ctx logger info "Setting kafka topic..."
sudo bin/kafka-topics.sh --create --zookeeper localhost:${zookeeper_port} --replication-factor 1 --partitions 1 --topic topic1
ctx logger info "'topic1' topic was set."
