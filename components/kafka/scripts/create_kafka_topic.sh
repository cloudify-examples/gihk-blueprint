#!/bin/bash -e
. $(ctx download-resource "components/utils")
cd /opt/kafka/kafka_2.10-0.8.2.2

ctx logger info "Setting kafka topic..."
export HOST_IP=$(ctx instance host_ip)

sudo bin/kafka-topics.sh --create --zookeeper ${HOST_IP}:2181 --replication-factor 3 --partitions 1 --topic topic1
ctx logger info "'topic1' topic was set."
